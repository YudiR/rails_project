class Item < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :users

    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :location, presence: true 
end
