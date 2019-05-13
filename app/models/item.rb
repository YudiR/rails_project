class Item < ApplicationRecord

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

    monetize :price_cents 
    
    belongs_to :user
    has_and_belongs_to_many :users

    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :location, presence: true 
end
