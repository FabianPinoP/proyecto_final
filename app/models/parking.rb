class Parking < ApplicationRecord


   has_one_attached :image

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
