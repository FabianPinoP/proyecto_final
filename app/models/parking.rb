class Parking < ApplicationRecord

   belongs_to :user
   has_one_attached :image
   has_many :order_items
   has_many :orders, through: :order_items



   acts_as_votable
    enum size: %i[Small Medium Large Plus ]

    def self.search(search)

        if search 
           where('town LIKE ?', "%#{search}%")
         else
            Parking.all
         end
       end
end
