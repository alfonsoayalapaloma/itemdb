module Refinery
  module Items
    module Admin
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/items/item',
                :title_attribute => 'nombre', :xhr_paging => true

      end
    end
  end
end
