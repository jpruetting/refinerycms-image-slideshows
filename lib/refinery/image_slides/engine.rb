module Refinery
  module ImageSlides
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ImageSlides

      engine_name :refinery_image_slideshows

      initializer "register refinerycms_image_slides plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "image_slides"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.image_slides_admin_image_slides_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/image_slides/image_slide'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ImageSlides)
      end
    end
  end
end
