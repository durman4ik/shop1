class Product < ActiveRecord::Base

  has_many :orders, through: :line_items
  has_many :line_items
  has_many :product_properties
  has_many :product_attachments

  accepts_nested_attributes_for :product_properties
  accepts_nested_attributes_for :product_attachments

  validates :title, :description, presence: true

  def self.latest
    Product.order(:updated_at).last
  end
end
