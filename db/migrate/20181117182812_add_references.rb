class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :users, foreign_key: true
    add_reference :questions, :quizzes, foreign_key: true
  end
end
