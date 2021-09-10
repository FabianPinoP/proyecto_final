class Parking < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :order_items
  has_many :orders, through: :order_items

  validates_uniqueness_of :address
  validates :price, presence: :true
  validates :description, presence: :true
  validates :size, presence: :true
  validates :address, presence: :true







  acts_as_votable
  enum size: %i[Small Medium Large Plus ]

  def self.search(search)
   	if search 
      where('town LIKE ?', "%#{search}%")
    else
      Parking.all
    end
  end

 def self.discount_stock(parkings)
	parkings.each do |par|
		par.stock -= 1
		par.save
	end
 end


 def find_address
  Geocoder.coordinates(self.address)
 end

end
