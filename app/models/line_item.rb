class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def subtotal_price
    product.price * quantity
  end

  def increase
    if self.quantity < 10
      self.quantity += 1
      self.save
    end
  end

  def decrease
    if self.quantity > 1
      self.quantity -= 1
      self.save
    else
      self.destroy
    end
  end
end
