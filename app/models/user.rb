class User < ApplicationRecord
    has_secure_password

    has_many :items
    has_and_belongs_to_many :watch, class_name: "Item", join_table: "people_watch", foreign_key: "user_id", association_foreign_key: "item_id"


    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    
end
