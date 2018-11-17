class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new quiz_params
    if @quiz.save
      redirect_to quiz_path(@quiz.id)
    else
      render :new
    end
  end

  def show    
  end
  
  def index
    @quizzes = Quiz.all.order(:title)
  end

  def edit
  end

  def update
    if @quiz.update quiz_params
      redirect_to quiz_path(@quiz.id)
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  private

  def find_quiz
    @quiz = Quiz.find params[:id]
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end

end
