class Order < ApplicationRecord
  belongs_to :user
  validates :number, uniqueness: true
  has_many :order_items
  has_many :parkings, through: :order_items

  def generate_number

    self.number = loop do
    rand_str = "PO#{Array.new(9){rand(9)}.split}"
    break rand_str unless Order.exists?(number: rand_str)
     end 
  end

  def add_parking(parking_id)
    parking = Parking.find(parking_id)
    if parking
    #creamos la orden con los datos del productos según queramos mostar
      order_items.create(parking_id: parking.id, price: parking.price)
    end
  end

end
