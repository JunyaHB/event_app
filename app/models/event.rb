class Event < ApplicationRecord
    validates :event_name, {presence: true, length: {maximum: 25}}  
    validates :date, {presence: true}  
    validates :content, {presence: true, length: {maximum: 500}}  
end
