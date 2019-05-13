class Search < ApplicationRecord

    def search_items

        # the tutorial only had keywords in {}. When I added them to the others the error jumped
      
        items = items.where(["name LIKE ?"%#{keywords}%]) if keywords.present?
        items = items.where(["category LIKE ?"%#{category}%]) if category.present?
        items = items.where(["location LIKE ?"%#{location}%]) if location.present?
        items = items.where(["price >= ?"%#{min_price}%]) if min_price.present?
        items = items.where(["price <= ?"%#{max_price}%]) if max_price.present?

          
         

    
        
    end
end

