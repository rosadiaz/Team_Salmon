class Quiz < ApplicationRecord
  has_many :results
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true 
end
