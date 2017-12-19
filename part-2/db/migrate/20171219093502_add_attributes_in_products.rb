class AddAttributesInProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :attributes, :jsonb
  end
end
