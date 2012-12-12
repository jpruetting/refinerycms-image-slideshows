module Refinery
  module ImageSlides
    class ImageSlidesController < ::ApplicationController

      before_filter :find_all_image_slides
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @image_slide in the line below:
        present(@page)
      end

      def show
        @image_slide = ImageSlide.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @image_slide in the line below:
        present(@page)
      end

    protected

      def find_all_image_slides
        @image_slides = ImageSlide.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/image_slides").first
      end

    end
  end
end
