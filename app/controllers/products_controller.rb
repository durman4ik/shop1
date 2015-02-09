class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :manage, :all
    @products = Product.all
  end

  def show

  end

  def new
    authorize! :manage, :all
    @product = Product.new
    @product.product_properties.build
  end

  def create
    authorize! :manage, :all
    @product = Product.create!(product_params)
    redirect_to catalog_path
  end

  def edit
    authorize! :manage, :all
    @product.product_properties.build
  end

  def update
    authorize! :manage, :all
    @product.update(product_params)
    redirect_to catalog_path
  end

  def destroy
    authorize! :manage, :all
    @product.destroy!
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url,
                                     product_properties_attributes: [:id ,:name, :value, :price, :_destroy ])
  end
end