class RenameAttributesToDataFeaturesInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :attributes, :data_features
  end
end
