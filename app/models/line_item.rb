class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def copy_price
    self.subtotal_price = product.product_properties.first.property_price if product.product_properties.length == 1
  end

  def subtotal_price
    product.product_properties.first.property_price * quantity #TODO: сделать для работы с разными ценами.
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
