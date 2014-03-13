module Sancho
  class Engine < ::Rails::Engine
    isolate_namespace Sancho
    # puts "Engine < ::Rails::Engine"

    config.generators do |g|
      g.template_engine :haml
    end

    initializer :add_generator_templates do
      # puts "File::expand_path('../templates', __FILE__): #{File::expand_path('../templates', __FILE__)}"
      config.generators.templates.unshift(File::expand_path('../templates', __FILE__))
    end

    # config.generators do |g|
    #   g.templates.unshift File::expand_path('../templates', __FILE__)
    # end
    # config.app_generators do |g|
    #   g.templates.unshift File::expand_path('../templates', __FILE__)
    # end
  end
end
