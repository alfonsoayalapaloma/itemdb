# This migration comes from refinery_items (originally 1)
class CreateItemsItems < ActiveRecord::Migration

  def up
    create_table :refinery_items do |t|
      t.string :nombre
      t.string :id
      t.string :descripcion
      t.integer :cantidad
      t.integer :photo_id
      t.integer :ficha_id
      t.integer :troubleshooting_id
      t.string :homologacion
      t.datetime :date
      t.string :comentarios
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-items"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/items/items"})
    end

    drop_table :refinery_items

  end

end
