class ProductPropertiesController < ApplicationController

  # TODO: разобраться с эти контроллером.

  before_action :set_product_property, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @product_properties = ProductProperty.all
    respond_with(@product_properties)
  end

  def show
    respond_with(@product_property)
  end

  def new
    @product_property = ProductProperty.new
    respond_with(@product_property)
  end

  def edit
  end

  def create
    @product_property = ProductProperty.new(product_property_params)
    @product_property.save
    respond_with(@product_property)
  end

  def update
    @product_property.update(product_property_params)
    respond_with(@product_property)
  end

  def destroy
    @product_property.destroy
    respond_with(@product_property)
  end

  private
    def set_product_property
      @product_property = ProductProperty.find(params[:id])
    end

    def product_property_params
      params[:product_property]
    end
end
