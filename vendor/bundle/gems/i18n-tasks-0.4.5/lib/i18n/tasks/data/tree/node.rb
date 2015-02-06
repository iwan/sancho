# coding: utf-8

require 'i18n/tasks/data/tree/traversal'
require 'i18n/tasks/data/tree/siblings'
module I18n::Tasks::Data::Tree
  class Node
    attr_accessor :value
    attr_reader :key, :children, :parent

    def initialize(opts = {})
      @key          = opts[:key].try(:to_s)
      @value        = opts[:value]
      @data         = opts[:data]
      @parent       = opts[:parent]
      self.children = opts[:children] if opts[:children]
    end

    def attributes
      {key: @key, value: @value, data: @data, parent: @parent, children: @children}
    end

    def derive(new_attr = {})
      self.class.new(attributes.merge(new_attr))
    end

    def key=(value)
      dirty!
      @key = value.try(:to_s)
    end

    def children=(nodes_or_siblings)
      dirty!
      @children = Siblings.new(nodes: nodes_or_siblings, parent: self)
    end

    def each(&block)
      return to_enum(:each) { 1 } unless block
      [self].each(&block)
    end

    include Enumerable
    include Traversal

    # null nodes are like nil, but do not blow up and can have children
    # never yielded during traversal, but are passed through and can have non-null children
    def null?
      key.nil?
    end

    def hash_or_value
      leaf? ? value : children.try(:to_hash)
    end

    def leaf?
      !children?
    end

    attr_writer :leaf

    # a node with key nil is considered Empty. this is to allow for using these nodes instead of nils
    def root?
      !parent?
    end

    def parent?
      parent && !parent.null?
    end

    def children?
      children && children.any?
    end

    def data
      @data ||= {}
    end

    def data?
      @data.present?
    end

    # do not use directly. use parent.append(node) instead
    def parent=(value)
      return if @parent == value
      if value
        @parent.children.remove!(self) if @parent && @parent.children
        @parent = value
        dirty!
      end
      @parent
    end

    def siblings
      parent.children
    end

    def get(key)
      children.get(key)
    end

    alias [] get

    # append and reparent nodes
    def append!(nodes)
      if nodes.any?
        if @children
          @children.merge!(nodes)
        else
          @children = Siblings.new(nodes: nodes, parent: self)
        end
      end
      self
    end

    def append(nodes)
      derive.append!(nodes)
    end

    def full_key(opts = {})
      root = opts.key?(:root) ? opts[:root] : true
      @full_key       ||= {}
      @full_key[root] ||= "#{"#{parent.full_key(root: root)}." if parent? && (root || parent.parent?)}#{key}"
    end

    def walk_to_root(&visitor)
      return to_enum(:walk_to_root) unless visitor
      visitor.yield self unless self.null?
      parent.walk_to_root &visitor if parent?
    end

    def walk_from_root(&visitor)
      return to_enum(:walk_from_root) unless visitor
      walk_to_root.reverse_each do |node|
        visitor.yield node
      end
    end

    def to_nodes
      Nodes.new([self])
    end

    def to_hash
      @hash ||= begin
        children_hash = (children || {}).map(&:to_hash).reduce(:deep_merge) || {}
        if null?
          children_hash
        elsif leaf?
          {key => value}
        else
          {key => children_hash}
        end
      end
    end

    delegate :to_json, to: :to_hash
    delegate :to_yaml, to: :to_hash

    def inspect(level = 0)
      label =
          if null?
            Term::ANSIColor.dark '∅'
          else
            key = Term::ANSIColor.color(1 + level % 15, self.key)
            if leaf?
              value = Term::ANSIColor.cyan(self.value.to_s)
              "#{key}: #{value}"
            else
              "#{key}"
            end + (self.data? ? " #{self.data}" : '')
          end

      r = "#{'  ' * level}#{label}"
      if children?
        r += "\n" + children.map { |c| c.inspect(level + 1) }.join("\n") if children?
      end
      r
    end

    protected

    def dirty!
      @hash     = nil
      @full_key = nil
    end

    class << self
      def null
        new
      end

      # value can be a nested hash
      def from_key_value(key, value)
        Node.new(key: key).tap do |node|
          if value.is_a?(Hash)
            node.children = Siblings.from_nested_hash(value, parent: node)
          else
            node.value = value
          end
        end
      end
    end
  end
end
