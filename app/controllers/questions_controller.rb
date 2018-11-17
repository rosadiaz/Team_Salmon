class QuestionsController < ApplicationController
    before_action :find_question, only: [:show, :edit, :update, :destroy]
    before_action :find_quiz, only: [:new, :create]

    def new
        @question = Question.new
    end

    def create

        @question = Question.new question_params
        @question.quiz = @quiz

        if @question.save
            # UPDATE DOM WITH NEW QUESTION
            flash[:success] = "Question made!"
            redirect_to quiz_path(@quiz)
        else
            render :new
            # FLASH ERROR
        end
    end

    def show
        render :show
    end

    def edit
    end

    def update
        if @question.update question_params
            redirect_to question_path(@question.id)
        else
            render :edit
        end
    end

    def destroy
        @question.destroy
        # AFTER REDIRECT TO SOMEWHERE
    end

    private
    def question_params
        params.require(:question).permit(:title, :option0, :option1, :option2, :option3, :correct_answer)
    end

    def find_quiz
        # @quiz = Quiz.find params[:quiz_id]
    end

    def find_question
        @question = Question.find params[:id]
    end

    def question_params
        params.require(:question).permit(:question, :option0, :option1, :option2, :option3, :correct_answer)
    end

end
