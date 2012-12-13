module Refinery
  module ImageSlideshows
    class ImageSlideshow < Refinery::Core::BaseModel
      self.table_name = 'refinery_image_slideshows'

      attr_accessible :title, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true

      has_many :image_slides, :foreign_key => 'refinery_image_slideshow_id', :class_name => 'Refinery::ImageSlideshows::ImageSlide', :dependent => :destroy
    end
  end
end
