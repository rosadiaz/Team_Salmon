class QuizzesController < ApplicationController

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
    @quiz = Quiz.find params[:id]
  end
  
  def index
    @quizzes = Quiz.all.order(:title)
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end

end
