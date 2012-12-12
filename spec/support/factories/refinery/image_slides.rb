
FactoryGirl.define do
  factory :image_slide, :class => Refinery::ImageSlides::ImageSlide do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

