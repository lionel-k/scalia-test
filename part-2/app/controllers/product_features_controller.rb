class ProductFeaturesController < ApplicationController
  before_action :set_product, only: [:create]

  def create
    @product_feature = ProductFeature.new(product_feature_params)
    @product_feature.product = @product
    if @product_feature.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  private

  def product_feature_params
    params.require(:product_feature).permit(:product_id, :description, :feature_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
