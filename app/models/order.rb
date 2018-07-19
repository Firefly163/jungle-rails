class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def self.find_order_with_items(id)
    includes(line_items: [:product]).find(id)
  end
end
