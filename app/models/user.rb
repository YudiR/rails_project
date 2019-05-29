class User < ApplicationRecord
    has_secure_password

    has_many :items
    has_and_belongs_to_many :watch, class_name: "User", join_table: "people_watch", foreign_key: "User_id", association_foreign_key: "Item_id"


    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    
end
