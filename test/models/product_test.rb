require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(title: "Sample Product")
  end

  test "should be valid with valid attributes" do
    assert @product.valid?
  end

  test "should not be valid without a title" do
    @product.title = nil
    assert_not @product.valid?
  end

  test "should not be valid with a duplicate title" do
    duplicate_product = @product.dup
    @product.save!
    assert_not duplicate_product.valid?
  end

  test "should not be valid with special characters in title" do
    @product.title = "Invalid@Title!"
    assert_not @product.valid?
  end

  test "should not be valid with numbers in title" do
    @product.title = "Title123"
    assert_not @product.valid?
  end
end
