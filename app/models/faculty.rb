class Faculty < ApplicationRecord
    has_secure_password
    
    #Validations
    validates :fname, presence: true
    validates :lname, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    
    has_many :students
end