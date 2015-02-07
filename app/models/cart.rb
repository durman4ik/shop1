class Cart < ActiveRecord::Base
  has_many  :line_items, dependent: :destroy

  def empty
    if self.line_items.length == 0
      I18n.t('cart.empty')
    end
  end

  def subtotal_price
    line_items.to_a.sum { |item| item.subtotal_price }
  end

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

end
