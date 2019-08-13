class User < ApplicationRecord

    has_many :joins

    validates :name, {presence: true, length: {maximum: 10}}  
    validates :introduction, {length: {maximum: 400}}  
    
def events
    return Event.where(user_id: self.id)
end

    
end
