module Sancho
  module ApplicationHelper
    # Public: Pick the correct arguments for form_for when shallow routes 
    # are used.
    #
    # parent - The Resource that has_* child
    # child - The Resource that belongs_to parent.
    def shallow_args(parent, child)
      child.try(:new_record?) ? [parent, child] : child
      # params[:action] == 'new' ? [parent, child] : child
    end


    def error_notification(model)
      if model.errors.any?
        content_tag(:div, :class => 'row') do
          content_tag(:div, :class => 'col-md-6 col-md-offset-3') do
            content_tag(:div, :id => 'error_explanation', :class => "alert alert-danger") do
              "#{pluralize(model.errors.count, "error")} prohibited this project from being saved:".html_safe +
              tag(:br)+
              content_tag(:ul) {
                model.errors.full_messages.reduce(''){|c, msg| c << content_tag(:li, msg) }.html_safe
              }
            end
          end
        end
      end
    end

    def build_btn_class(options)
      sizes = {
        3 => { mini: "btn-mini", small: "btn-small", default: "", norm: "", large: "btn-large" },
        4 => { mini: "btn-xs", small: "btn-sm", default: "", norm: "", large: "btn-lg" }}
      btn_class = options[:kind] # is an array
      btn_class << sizes[rails_main_vers][options[:button].to_sym]
      btn_class.join(" ")
    end

    def default_btn_options(action)
      kind = ["btn"] << (action==:destroy ? "btn-danger": "btn-default")
      { 
        :button => :mini,
        :kind => kind,
        :label => t(".#{action}", :default => t("helpers.links.#{action}")) # 'en.projects.show.index', def: 'helpers.links.show'
      }
    end
    
    def link_to_show(object, path, options={})
      options.reverse_merge!(default_btn_options(:show))
      build_link(object, path, :show, options)
    end

    def link_to_new(object, path, options={})
      options.reverse_merge!(default_btn_options(:new))
      build_link(object, path, :create, options)
    end

    def build_link(object, path, action, options)
      link_opts = { :class => build_btn_class(options) }
      link_opts.merge!({:method => :delete, :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) }}) if action==:destroy
      if can? action, object
        if options[:glyphicon]
          link_to content_tag(:span, nil, :class => "glyphicon glyphicon-#{options[:glyphicon]}")+" "+options[:label], path, link_opts
        else
          link_to options[:label], path, link_opts
        end
      end
    end

    def link_to_duplicate(object, path, options={})
      options.reverse_merge!(default_btn_options(:duplicate))
      build_link(object, path, :create, options)
    end

    def link_to_back(options={})
      options.reverse_merge!(default_btn_options(:back))
      link_opts = { :class => build_btn_class(options) }
      link_to options[:label], :back, link_opts
    end

    def link_to_index(object, path, options={})
      options.reverse_merge!(default_btn_options(:index))
      build_link(object, path, :index, options)
    end


    def link_to_edit(object, path, options={})
      options.reverse_merge!(default_btn_options(:edit))
      build_link(object, path, :edit, options)
    end

    def link_to_destroy(object, path, options={})
      options.reverse_merge!(default_btn_options(:destroy))
      build_link(object, path, :destroy, options)
      # if can? :destroy, object
      #   link_to options[:label], path, :method => "delete", 
      #     :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) }, 
      #     :class => build_btn_class(options)
      # end
    end

    def rails_main_vers
      Rails.version.split(".").first.to_i
    end
  end
end
