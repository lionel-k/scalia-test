require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "All Products"
    assert_selector ".product", count: Product.count
  end


  test "lets a signed in user create a new product" do
    login_as users(:toto)
    visit "/products/new"
    click_on 'Create!'

    # Should be redirected to show page of the last product created
    assert_equal product_path(Product.last), page.current_path
  end
end
