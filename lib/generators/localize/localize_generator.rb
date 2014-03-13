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

class LocalizeGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_files
    # puts "file_name: #{file_name}"
    # puts "plural_name: #{plural_name}"
    excluded_attrib = ["id", "created_at", "updated_at", "creator_id", "updater_id"]
    @attributes = Kernel.const_get(class_name).send(:attribute_names)-excluded_attrib
    @google_translator = GoogleTranslate.new

    I18n.available_locales.each do |locale|
      @loc = locale.to_s
      template "model.rb", "config/locales/models/#{file_name}/#{locale}.yml"
      template "view.rb", "config/locales/views/#{plural_name}/#{locale}.yml"
    end
  end

end
