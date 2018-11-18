class ResultsController < ApplicationController

    before_action :find_quiz, only: [ :create, :show ]
    before_action :authorize_user!, only: [ :create ]
  
    def create
        @score = calculate_score(params)

        @result = Result.new(user: current_user, quiz: @quiz, score: @score)
        if @result.save
            flash[:success] = "Answers Submited"
            redirect_to quiz_result_path(@quiz.id, @result.id)	
        else
            flash[:danger] = @result.errors.full_messages.join(", ");
        end
    end
    
    def show
        @result = Result.find params[:id]
        @max_score = @quiz.questions.length
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

    def calculate_score(answers)
        5
    end
end
