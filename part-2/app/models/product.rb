class Product < ApplicationRecord
  belongs_to :user
  has_many :product_features, dependent: :destroy
  has_many :features, through: :product_features
end
