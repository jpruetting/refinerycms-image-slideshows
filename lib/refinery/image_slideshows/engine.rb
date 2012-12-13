module Refinery
  module ImageSlideshows
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ImageSlideshows

      engine_name :refinery_image_slideshows

      initializer "register refinerycms_image_slideshows plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "image_slideshows"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.image_slideshows_admin_image_slideshows_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/image_slideshows/image_slideshow'
          }
          plugin.menu_match = %r{refinery/(image_slides|image_slideshows)(/.+?)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ImageSlideshows)
      end
    end
  end
end
