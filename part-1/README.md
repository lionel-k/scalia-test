## Scalia Full Stack test - Part 1

The Ruby/ActiveRecord to render the variable could be

```ruby
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
```

To test the app:

- Clone The project
- Run `bundle install`
- Run `rake db:create` / `rake db:migrate` / `rake db:seed`
- Run `rake console`
- Run `User.first.products_details`
- Run `User.second.products_details`
