class Item < ApplicationRecord

    enum category: { Electronics: 0, Jewelry: 1, Kitchen: 2,  Womens_Clothing: 3, Mens_Clothing: 4, Watches: 5,
    Sports_And_Outdoors: 6, Other: 7}

    def self.search(search)
        if search
            item = Item.find_by(title: search)
        if item
            self.where(id: item)
        else 
            Item.all
        end
        else
        Item.all
            
        
        end
    end

# shrine:
include ImageUploader[:image]
    


    
    belongs_to :user
    has_and_belongs_to_many :people, class_name: "User", join_table: "people_watch", foreign_key: "item_id", association_foreign_key: "user_id"

    validates :title, presence: true
    validates :price_cents, presence: true
    validates :description, presence: true
    validates :location, presence: true 
end
