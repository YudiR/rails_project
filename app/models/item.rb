class Item < ApplicationRecord

    def self.search(search)
        if search
            item = Item.find_by(title: search)
        if item
            self.where(item_id: item)
        else 
            Item.all
        end
        else
        Item.all
            # where(["title LIKE ?", "%#{search}%"])
        
        end
    end

    # def self.search(title,category) 
        # return scoped unless title.present? || category.present?
        # where(['item_title LIKE ? AND item_category LIKE ?', "%#{title}%", "%#{category}%"])
        
        # if search 
        # Item.where('title LIKE :title or category LIKE :category', search:"%#{search}%" )
        # else 
        #     Item.all
        # end
    
    # end
    monetize :price_cents 
    
    belongs_to :user
    has_and_belongs_to_many :users

    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :location, presence: true 
end
