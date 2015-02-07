class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy, :increase, :decrease]

  before_action :set_line_item, only: [:show, :edit, :update, :destroy, :increase, :decrease]

  respond_to :js

  def index
    @line_items = LineItem.all
    respond_with(@line_items)
  end

  def show
    respond_with(@line_item)
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.js { render 'line_items/cart', collection: @current_item = @line_item }
      else
        format.js { render nothing: true }
      end
    end

  end

  def update
    @line_item.update(line_item_params)
    respond_with(@line_item)
  end

  def destroy
    sleep(0.3.seconds)
    respond_to do |format|
      if @line_item.destroy
        format.js { render 'line_items/cart' }
      else
        format.js { render nothing: true  }
      end
    end
  end

  def increase
    respond_to do |format|
      if @line_item.increase
        format.js { render 'line_items/cart', collection: @current_item = @line_item }
      else
        format.js { render nothing: true  }
      end
    end
  end

  def decrease
    respond_to do |format|
      if @line_item.decrease
        format.js { render 'line_items/cart', collection: @current_item = @line_item }
      else
        format.js { render nothing: true }
      end
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
