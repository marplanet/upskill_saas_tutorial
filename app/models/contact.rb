class Contact < ActiveRecord::Base
  #Contact form validations
  validates :name, presence: true
  validates :phoneNumber, presence: true
  validates :comments, presence: true
   
    
end