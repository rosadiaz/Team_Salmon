class User < ApplicationRecord
    has_many :results
    has_many :quizzes, dependent: :nullify
    
    has_secure_password 


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

#    validates :first_name, presence: true,
#    validates :last_name, presence: true,
validates :nickname, presence: true, uniqueness: true
validates :email, presence: true, 
   uniqueness: true,
   format: VALID_EMAIL_REGEX
end
