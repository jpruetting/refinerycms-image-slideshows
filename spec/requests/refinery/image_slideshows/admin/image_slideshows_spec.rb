# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ImageSlideshows" do
    describe "Admin" do
      describe "image_slideshows" do
        login_refinery_user

        describe "image_slideshows list" do
          before do
            FactoryGirl.create(:image_slideshow, :title => "UniqueTitleOne")
            FactoryGirl.create(:image_slideshow, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.image_slideshows_admin_image_slideshows_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.image_slideshows_admin_image_slideshows_path

            click_link "Add New Image Slideshow"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ImageSlideshows::ImageSlideshow.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::ImageSlideshows::ImageSlideshow.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:image_slideshow, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.image_slideshows_admin_image_slideshows_path

              click_link "Add New Image Slideshow"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ImageSlideshows::ImageSlideshow.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:image_slideshow, :title => "A title") }

          it "should succeed" do
            visit refinery.image_slideshows_admin_image_slideshows_path

            within ".actions" do
              click_link "Edit this image slideshow"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:image_slideshow, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.image_slideshows_admin_image_slideshows_path

            click_link "Remove this image slideshow forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ImageSlideshows::ImageSlideshow.count.should == 0
          end
        end

      end
    end
  end
end
