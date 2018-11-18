class Quiz < ApplicationRecord
  has_many :results, dependent: :nullify
  has_many :quiz_taker, through: :results, source: :user
  belongs_to :user
  has_many :questions, dependent: :destroy

  validates :title, presence: true, 
                    uniqueness: true,
                    length: { maximum: 75}
  validates :description, presence: true,
                          length: { minimum: 25 }
end
