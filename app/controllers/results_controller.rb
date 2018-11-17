class ResultsController < ApplicationController

    before_action :find_quiz, only: [ :create ]
    before_action :authorize_user!, only: [ :create ]
  
    def create
        quiz = Quiz.find(params[:quiz_id])
        result = Result.new(user: current_user, quiz: quiz)

        if result.save
            flash[:success] = "Quiz Completed"
        else
            flash[:success] = "Question liked"
        end
    end

    private
    def find_quiz
        @quiz = Quiz.find params[:quiz_id]
    end

    def authorize_user!
        unless can?(:take, @quiz)
            flash[:danger] = "Can't take your own quiz"
            redirect_to quiz_path(@quiz)
        end
    end 
end
