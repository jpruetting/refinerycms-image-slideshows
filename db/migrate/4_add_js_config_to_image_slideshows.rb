class AddJsConfigToImageSlideshows < ActiveRecord::Migration
  def change
    add_column :refinery_image_slideshows, :js_config, :text
  end
end