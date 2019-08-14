class User < ApplicationRecord
    has_secure_password
    has_many :joins
    has_many :events


    validates :name, {presence: true, uniqueness: true, length: {maximum: 10}}  
    validates :introduction, {length: {maximum: 400}}  
    
def events
    return Event.where(user_id: self.id)
end

    
end
