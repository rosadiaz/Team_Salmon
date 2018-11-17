class QuestionsController < ApplicationController
    before_action :find_quiz, only: [:create]
    before_action :find_question, only: [:destroy]

    def new
        @question = Question.new
    end

    def create

        @question = Question.new question_params
        @question.quiz = find_quiz

        if @question.save
            # UPDATE DOM WITH NEW QUESTION
        else
            # FLASH ERROR
        end
    end

    def edit
    end

    def update
        if @question.update question_params
            # REFRESH THE DOM TO SHOW CHANGES
        else
            # FLASH ERROR
        end
    end

    def destroy
        @question.destroy
        # AFTER DESTROY REFRESH DOM TO SHOW DELETION
    end

    private
    def find_quiz
        @quiz = Quiz.find params[:quiz_id]
    end

    def find_question
        @question = Question.find params[:id]
    end

end
