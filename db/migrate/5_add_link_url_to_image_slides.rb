class AddLinkUrlToImageSlides < ActiveRecord::Migration
  def change
    add_column :refinery_image_slides, :link_url, :string
  end
end