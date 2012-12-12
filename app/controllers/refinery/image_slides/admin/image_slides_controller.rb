module Refinery
  module ImageSlides
    module Admin
      class ImageSlidesController < ::Refinery::AdminController

        crudify :'refinery/image_slides/image_slide', :xhr_paging => true

      end
    end
  end
end
