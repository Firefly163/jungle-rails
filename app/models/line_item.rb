class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

  def name
    product.name
  end
  def description
    product.description
  end
  def image
    product.image
  end

end
