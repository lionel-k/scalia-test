class CreateUsersProductsPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   :username
      t.timestamps
    end

    create_table :products do |t|
      t.string      :name
      t.string      :size
      t.references  :user, foreign_key: true, index: true
      t.timestamps
    end

    create_table :prices do |t|
      t.string      :currency
      t.string      :value
      t.references  :product, foreign_key: true, index: true
      t.timestamps
    end
  end
end
