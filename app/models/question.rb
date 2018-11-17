class Question < ApplicationRecord
    belongs_to :quiz

    validates :question, presence: true
    validates :option0, presence: true
    validates :option1, presence: true
    validates :option2, presence: true
    validates :option3, presence: true
    validates :correct_answer, 
        presence: true,
        numericality: { less_than: 4 }

end
