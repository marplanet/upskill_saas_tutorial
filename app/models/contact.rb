class Contact < ActiveRecord::Base
    
  validates :name, presence: true
  validates :phoneNumber, presence: true
  validates :comments, presence: true
   
    
end