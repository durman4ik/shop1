class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  respond_to :html

  def new
    @cart = Cart.new
    respond_with(@cart)
  end

  def edit
  end

  def show
  end


  def create
    @cart = Cart.new(cart_params)
    @cart.save
    respond_with(@cart)
  end

  def update
    @cart.update(cart_params)
    respond_with(@cart)
  end

  def destroy
    authorize! :delete, Cart
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_with(@cart)
  end

  private

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to not_found_path
    end

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params[:cart]
    end
end
