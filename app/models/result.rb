class Result < ApplicationRecord
    belongs_to :user dependent: :destroy
    belongs_to :quiz dependent: :nullify
end
