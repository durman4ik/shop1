class Product < ActiveRecord::Base

  has_many :product_properties
  has_many :line_items

  accepts_nested_attributes_for :product_properties

  validates :title, :description, :image_url, presence: true
  # validates :image_url, allow_blank: true, format: {
  #                         with: %r{\.(gif|jpg|png)\Z}i,
  #                         message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
  #                     }

  def self.latest
    Product.order(:updated_at).last
  end
end
