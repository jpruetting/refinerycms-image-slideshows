
FactoryGirl.define do
  factory :image_slideshow, :class => Refinery::ImageSlideshows::ImageSlideshow do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

