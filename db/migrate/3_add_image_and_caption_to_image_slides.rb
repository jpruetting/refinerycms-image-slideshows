class AddImageAndCaptionToImageSlides < ActiveRecord::Migration
  def change
    add_column :refinery_image_slides, :image, :image
    add_column :refinery_image_slides, :caption, :string
  end
end