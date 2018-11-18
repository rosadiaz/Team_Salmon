class QuizzesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user = current_user
    
    if @quiz.save
      if @quiz.user.present?
        UserMailer.notify_quiz_created(@quiz).deliver_later(wait: 10.seconds)
      end
      redirect_to quiz_path(@quiz.id)
    else
      if @quiz.errors.present?
        flash.now[:danger] = @quiz.errors.full_messages.join(" • ")
      end 
      render :new
    end
  end

  def show
    @result = Result.new
  end
  
  def index
    @quizzes = Quiz.all.order(created_at: :desc)
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
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "Quiz does not exist!"
    redirect_to quizzes_path
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end

end
