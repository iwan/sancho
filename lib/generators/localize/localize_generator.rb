require 'google_translate'
# Reference:
# http://api.rubyonrails.org/classes/Rails/Generators/NamedBase.html
# http://rdoc.info/github/wycats/thor/master/Thor/Actions

class String
  def gootra(lang)
    lang = lang.to_sym
    return self.humanize if lang==:en
    begin
      tr = GoogleTranslate.new.translate(:en, lang, self)[0][0][0]
      tr.humanize
    rescue Exception => e
      puts e.message
      self.humanize
    end
  end
end

# include Nc
class LocalizeGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  # include Nc

  def generate_files
    # puts "**** module_namespacing:    #{module_namespacing}"
    puts "**** namespace:             #{namespace.inspect}"
    # puts "**** namespaced_class_path: #{namespaced_class_path}"
    # puts "**** namespaced_file_path:  #{namespaced_file_path}"
    # puts "**** namespaced_path:       #{namespaced_path}"
    puts "**** file_name:             #{file_name}"
    # extend Nc
    # puts "file_name: #{file_name}"
    # puts "plural_name: #{plural_name}"
    name = class_name.split("::")
    if name.size>1
      n = name[0...-1].join("::")
      puts "-----> n: #{Kernel.const_get(n)}"

      # extend Kernel.const_get(n)
    end
    excluded_attrib = ["id", "created_at", "updated_at", "creator_id", "updater_id"]
    puts "-----> class_name: #{class_name}"
    @attributes = Kernel.const_get(class_name).send(:attribute_names)-excluded_attrib
    @google_translator = GoogleTranslate.new

    I18n.available_locales.each do |locale|
      @loc = locale.to_s
      template "model.rb", "config/locales/models/#{file_name}/#{locale}.yml"
      template "view.rb", "config/locales/views/#{plural_name}/#{locale}.yml"
    end
  end

end
