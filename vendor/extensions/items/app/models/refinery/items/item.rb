module Refinery
  module Items
    class Item < Refinery::Core::BaseModel

      acts_as_indexed :fields => [:title, :body]
      alias_attribute :title, :nombre
      alias_attribute :body,  :descripcion

      self.table_name = 'refinery_items'

      attr_accessible :nombre, :id, :descripcion, :cantidad, :photo_id, :ficha_id, :troubleshooting_id, :homologacion, :date, :comentarios, :position

      acts_as_indexed :fields => [:nombre, :id, :descripcion, :homologacion, :comentarios]

      validates :nombre, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      belongs_to :ficha, :class_name => '::Refinery::Image'

      belongs_to :troubleshooting, :class_name => '::Refinery::Image'
    end
  end
end
