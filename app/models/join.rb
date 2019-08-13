class Join < ApplicationRecord
    validates :user_id, {presence: true}
    validates :event_id, {presence: true}
    

    
end
