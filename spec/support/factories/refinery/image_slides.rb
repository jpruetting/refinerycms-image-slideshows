
FactoryGirl.define do
  factory :image_slide, :class => Refinery::ImageSlideshows::ImageSlide do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

