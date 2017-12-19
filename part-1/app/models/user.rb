class User < ActiveRecord::Base
  has_many :products

  def products_details
    result = {}
    products = []
    result['user_id'] = self.id
    result['username'] = self.username
    products = self.products.includes(:prices).map do |product|
      { 'id': product.id,
        'name': product.name,
        'size': product.size,
        'prices': product.prices.map { |price| { 'currency': price.currency, 'value': price.value } }
      }
    end
    result['products'] = products
    result
  end
end
