module Refinery
  module ImageSlideshows
    module Admin
      class ImageSlidesController < ::Refinery::AdminController

        crudify :'refinery/image_slideshows/image_slide', :sortable => true

        before_filter :find_image_slideshow
        before_filter :find_image_slide, :except => [:index, :new]

        def index
          find_image_slides
        end

        def create
          @image_slide.position = (Refinery::ImageSlideshows::ImageSlide.maximum(:position) || 0) + 1

          if @image_slide.valid? && @image_slide.save
            redirect_to image_slides_path, :notice => 'Image slide was successfully created.'
          else
            render :action => :new
          end
        end

        def update
          if @image_slide.update_attributes(params[:image_slide])
            redirect_to image_slides_path, :notice => 'Image slide was successfully updated.'
          else
            render :action => :edit
          end
        end

        def destroy
          if @image_slide.destroy
            redirect_to image_slides_path, :notice => 'Image slide was successfully deleted.'
          end
        end

        private

        def image_slides_path
          refinery.image_slideshows_admin_image_slideshow_image_slides_path(@image_slideshow)
        end

        def find_image_slide
          @image_slide = Refinery::ImageSlideshows::ImageSlide.find(params[:id]) if params[:id]
          @image_slide ||= Refinery::ImageSlideshows::ImageSlide.new(params[:image_slide]) if params[:image_slide]
        end

        def find_image_slideshow
          @image_slideshow = Refinery::ImageSlideshows::ImageSlideshow.find(params[:image_slideshow_id])
        end

        def find_image_slides
          @image_slides = @image_slideshow.image_slides.order(:position) if @image_slideshow.present?
        end

      end
    end
  end
end
