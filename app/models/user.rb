class User < ApplicationRecord
    validates :name, {presence: true, length: {maximum: 10}}  
    validates :introduction, {length: {maximum: 400}}  
end
