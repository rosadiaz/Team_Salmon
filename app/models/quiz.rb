class Quiz < ApplicationRecord
  has_many :results, dependent: :nullify
  has_many :quiz_taker, through: :results, source: :user
  belongs_to :user
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true 
end
