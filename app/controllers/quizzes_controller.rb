class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new quiz_params
    if @quiz.save
      redirect_to :show
    else
      render :new
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end

end
