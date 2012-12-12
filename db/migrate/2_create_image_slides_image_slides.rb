class CreateImageSlidesImageSlides < ActiveRecord::Migration

  def up
    create_table :refinery_image_slides do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-image_slides"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/image_slides/image_slides"})
    end

    drop_table :refinery_image_slides

  end

end
