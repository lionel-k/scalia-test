class Product < ActiveRecord::Base
  belongs_to :user
  has_many :prices
end

