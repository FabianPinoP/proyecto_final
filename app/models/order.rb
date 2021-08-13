class Order < ApplicationRecord
  belongs_to :user
  validates :number, uniqueness: true
  has_many :order_items
  has_many :parkings, through: :order_items
  before_create -> { generate_number(hash_size) }

  def generate_number(size)
    self.number ||= loop do
      random = random_candidate(size)
      break random unless self.class.exists?(number: random)
    end
  end

  def random_candidate(size)
    "#{hash_prefix}#{Array.new(size){rand(size)}.join}"
  end

  def hash_prefix
    "BO"
  end

  def hash_size
    9
  end


  def add_parking(parking_id)
    parking = Parking.find(parking_id)
    if parking
    #creamos la orden con los datos del productos según queramos mostar
      order_items.create(parking_id: parking.id, price: parking.price)
      price_total
    end
  end

  def price_total
    sum = 0
    order_items.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end
end
