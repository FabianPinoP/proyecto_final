class Parking < ApplicationRecord
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
