class Event < ApplicationRecord
    
    has_many :joins
    
    validates :event_name, {presence: true, length: {maximum: 25}}  
    validates :date, {presence: true}  
    validates :content, {presence: true, length: {maximum: 500}}  

    def user
        return User.find_by(id: self.user_id)
    end

end
