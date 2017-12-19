require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "All Products"
    assert_selector ".product", count: Product.count
  end
end
