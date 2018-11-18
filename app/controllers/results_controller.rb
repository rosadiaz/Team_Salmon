class ResultsController < ApplicationController

    before_action :find_quiz, only: [ :create ]
    before_action :authorize_user!, only: [ :create ]
  
    def create
        @score = helpers.calculate_score(params)

        @result = Result.new(user: current_user, quiz: @quiz, score: @score)
        if @result.save
            flash[:success] = "Answers Submited"
            redirect_to root_path
        else
            flash[:danger] = @result.errors.full_messages.join(", ");
        end
    end
    
    def show
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
