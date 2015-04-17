class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ 'Наличные', 'Кредитная карта', 'Другое' ]
  DELIVERY_TYPES = [ 'Курьером по Минску', 'Почтой по Беларуси', 'Другой' ]

  has_many :line_items, dependent: :destroy

  validates :last_name, :address, :phone, :email, :city, presence: true
  validates :zip_code, numericality: true,
                       length: {minimum: 6, maximum: 6},
                       presence: true
  validates :first_name,  presence: true,
                          length: {minimum: 2}
  validates :phone, presence: true,
                    numericality: true,
                    length: {minimum: 7, maximum: 17}
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :delivery_type, inclusion: DELIVERY_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
