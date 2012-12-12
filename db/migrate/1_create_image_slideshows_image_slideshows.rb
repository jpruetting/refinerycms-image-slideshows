class CreateImageSlideshowsImageSlideshows < ActiveRecord::Migration

  def up
    create_table :refinery_image_slideshows do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-image_slideshows"})
    end

    drop_table :refinery_image_slideshows

  end

end
