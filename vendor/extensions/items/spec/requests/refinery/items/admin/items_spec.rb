# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Items" do
    describe "Admin" do
      describe "items" do
        login_refinery_user

        describe "items list" do
          before do
            FactoryGirl.create(:item, :nombre => "UniqueTitleOne")
            FactoryGirl.create(:item, :nombre => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.items_admin_items_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.items_admin_items_path

            click_link "Add New Item"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Nombre", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Items::Item.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Nombre can't be blank")
              Refinery::Items::Item.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:item, :nombre => "UniqueTitle") }

            it "should fail" do
              visit refinery.items_admin_items_path

              click_link "Add New Item"

              fill_in "Nombre", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Items::Item.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:item, :nombre => "A nombre") }

          it "should succeed" do
            visit refinery.items_admin_items_path

            within ".actions" do
              click_link "Edit this item"
            end

            fill_in "Nombre", :with => "A different nombre"
            click_button "Save"

            page.should have_content("'A different nombre' was successfully updated.")
            page.should have_no_content("A nombre")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:item, :nombre => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.items_admin_items_path

            click_link "Remove this item forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Items::Item.count.should == 0
          end
        end

      end
    end
  end
end
