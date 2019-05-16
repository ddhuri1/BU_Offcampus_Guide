class Clothing < ActiveRecord::Base
    validates :name, presence: true   
    validates :review, presence: true 
    validates :address, presence: true   
    validates :website, presence: true
end
