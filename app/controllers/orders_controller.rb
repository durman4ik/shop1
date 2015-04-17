class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    if @cart.line_items.empty?
      redirect_to catalog_url
      return
    end
    if current_user.nil?
      @order = Order.new
      render action: 'new'
    else
      @order = Order.new() #TODO: сделать автозаполение полей заказа.
    end

  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      OrderNotifier.received(@order).deliver
      OrderNotifier.new_order(@order).deliver
      redirect_to account_path
    else
      render action: 'new'
    end
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:first_name, :last_name, :address, :city, :zip_code, :phone, :email, :pay_type, :delivery_type)
    end
end
