class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :manage, :all
    @products = Product.all
  end

  def show
    @product_images = @product.product_attachments.all
  end

  def new
    authorize! :manage, :all
    @product = Product.new
    @product_properties = @product.product_properties.build
    @product_images = @product.product_attachments.build
  end

  def create

    authorize! :manage, :all
    @product = Product.new(product_params)
    if @product.save
      params[:product_properties].each do |property|
        @product_properties = @product.product_properties.create!(volume: property[1][:volume].join().to_i,
                                                                  performance: property[1][:performance].join().to_s,
                                                                  product_id: @product.id,
                                                                  property_price: property[1][:property_price].join().to_i)
      end

      params[:product_attachments]['image'].each do |image|
        @product_images = @product.product_attachments.create!(image: image, product_id: @product.id)
      end
      redirect_to catalog_path
    end
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
                                    product_properties_attributes: [:id ,:name, :value, :price, :_destroy ],
                                    product_attachments_attributes: [:id, :product_id, :image])
  end
end