module Refinery
  module ImageSlideshows
    class ImageSlide < Refinery::Core::BaseModel
      self.table_name = 'refinery_image_slides'

      attr_accessible :title, :image_id, :caption, :position, :image_slideshow_id

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true
      validates :image_id, :presence => true

      belongs_to :image_slideshow
      belongs_to :image
    end
  end
end
