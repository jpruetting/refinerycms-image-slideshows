module Refinery
  module ImageSlideshows
    module Admin
      class ImageSlideshowsController < ::Refinery::AdminController

        crudify :'refinery/image_slideshows/image_slideshow', :xhr_paging => true

      end
    end
  end
end
