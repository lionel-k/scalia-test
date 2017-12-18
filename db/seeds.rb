Price.destroy_all
Product.destroy_all
User.destroy_all

john = User.create(username: 'John')
nike = Product.create(name: 'Nike Air Force', size: '37', user: john)
addidas = Product.create(name: 'Adidas Stan Smith', size: '42', user: john)

Price.create(currency: 'Eur', value: '40', product: nike)
Price.create(currency: 'Dollars', value: '49', product: nike)
Price.create(currency: 'Eur', value: '30', product: addidas)
Price.create(currency: 'Dollars', value: '37', product: addidas)


mark = User.create(username: 'Mark')
hp = Product.create(name: 'HP Elite 820P', size: '13', user: mark)
asus = Product.create(name: 'Asus E403NA-FA049T', size: '17', user: mark)

Price.create(currency: 'Eur', value: '400', product: hp)
Price.create(currency: 'Dollars', value: '490', product: hp)
Price.create(currency: 'Eur', value: '300', product: asus)
Price.create(currency: 'Dollars', value: '370', product: asus)
