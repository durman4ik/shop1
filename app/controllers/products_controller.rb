class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create!(product_params)
  end

  def edit

  end

  def update
    @product.update(product_params)
  end

  def destroy
    @product.destroy!
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:products).permit(:title, :description, :image_url, :price)
  end
end
