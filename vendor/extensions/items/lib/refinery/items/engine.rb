module Refinery
  module Items
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Items

      engine_name :refinery_items

      initializer "register refinerycms_items plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "items"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.items_admin_items_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/items/item',
            :title => 'nombre'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Items)
      end
    end
  end
end
