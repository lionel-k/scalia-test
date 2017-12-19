class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:show]

  def index
    @feature_names = Feature.all.map { |feature| feature.name.to_sym }
    products = Product.includes(:product_features).includes(:features)
    @result = products.map do |product|
      features = product.product_features.map do |product_feature|
        { product_feature.feature.name.to_sym => product_feature.description }
      end
      {
        "id": product.id,
        "features": features.reduce({}, :merge)
      }
    end
    # render json: @result
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(user: current_user)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end


  def show
    @product_feature = ProductFeature.new
    @product_features = @product.product_features.includes(:feature)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
