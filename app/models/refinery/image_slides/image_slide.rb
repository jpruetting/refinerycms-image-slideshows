module Refinery
  module ImageSlides
    class ImageSlide < Refinery::Core::BaseModel
      self.table_name = 'refinery_image_slides'

      attr_accessible :title, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
