class Quiz < ApplicationRecord
<<<<<<< HEAD
  has_many :results
=======
  belongs_to :user
  has_many :questions, dependent: :destroy

>>>>>>> origin/integration
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true 
end
