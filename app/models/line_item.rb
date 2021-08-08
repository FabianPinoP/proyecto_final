class LineItem < ApplicationRecord
  belongs_to :parking
  belongs_to :order
  belongs_to :cart

  def total_price
    self.quantity * self.parking.price
  end
end
