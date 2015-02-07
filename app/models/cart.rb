class Cart < ActiveRecord::Base
  has_many  :line_items, dependent: :destroy

  def empty
    if self.line_items.length == 0
      I18n.t('cart.empty')
    end
  end

end
