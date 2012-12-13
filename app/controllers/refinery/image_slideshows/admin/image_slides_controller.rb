module Refinery
  module ImageSlideshows
    module Admin
      class ImageSlidesController < ::Refinery::AdminController

        crudify :'refinery/image_slideshows/image_slide', :sortable => true

        before_filter :find_image_slideshow

        def index
          find_image_slides
        end

        def create
          params[:image_slide].merge!({
            :position => Refinery::ImageSlideshows::ImageSlide.maximum(:position) + 1,
            :refinery_image_slideshow_id => params[:image_slideshow_id]
          })

          @image_slide = Refinery::ImageSlideshows::ImageSlide.new(params[:image_slide])

          if @image_slide.valid? && @image_slide.save
            redirect_to(refinery.image_slideshows_admin_image_slideshow_image_slides_path(@image_slideshow), :notice => 'Image slide was successfully created.')
          end
        end

        def update
          @image_slide = Refinery::ImageSlideshows::ImageSlide.find(params[:id])
 
          if @image_slide.update_attributes(params[:image_slide])
            redirect_to(refinery.image_slideshows_admin_image_slideshow_image_slides_path(@image_slideshow), :notice => 'Image slide was successfully updated.') 
          end
        end

        def destroy
          @image_slide = Refinery::ImageSlideshows::ImageSlide.find(params[:id])

          if @image_slide.destroy
            flash[:notice] = t('crudify.deleted', :what => @image_slide.class.to_s.underscore.humanize)
            redirect_to refinery.image_slideshows_admin_image_slideshow_image_slides_path(@image_slideshow)
          end
        end

        private

        def find_image_slideshow
          @image_slideshow = Refinery::ImageSlideshows::ImageSlideshow.find(params[:image_slideshow_id])
        end

        def find_image_slides
          @image_slides = @image_slideshow.present? ? @image_slideshow.image_slides.order(:position) : Refinery::ImageSlideshows::ImageSlide.all
        end

      end
    end
  end
end
