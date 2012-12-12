module Refinery
  module ImageSlideshows
    class ImageSlideshowsController < ::ApplicationController

      before_filter :find_all_image_slideshows
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @image_slideshow in the line below:
        present(@page)
      end

      def show
        @image_slideshow = ImageSlideshow.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @image_slideshow in the line below:
        present(@page)
      end

    protected

      def find_all_image_slideshows
        @image_slideshows = ImageSlideshow.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/image_slideshows").first
      end

    end
  end
end
