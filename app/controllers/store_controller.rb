class StoreController < ApplicationController

  def index
    @products = Product.includes(:product_properties).order(:title)
  end

  def render_cart_ico
    respond_to do |format|
      format.js do
        render 'store/header'
      end
    end
  end
end
