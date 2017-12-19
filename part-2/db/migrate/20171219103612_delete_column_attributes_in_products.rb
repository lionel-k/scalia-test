class DeleteColumnAttributesInProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :data_features
  end
end
