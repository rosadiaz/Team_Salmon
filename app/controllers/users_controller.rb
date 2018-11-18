class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy, :completed_quizzes, :created_quizzes]


  def new
      @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thank you for signing up!"
      redirect_to quizzes_path
    else
      render :new
    end
  end

  def show 
  end 

  def update
      if @user.update user_params
      redirect_to user_path(@user.id)
      else
      render :edit
      end

  end


  def destroy
      @user.destroy 
      redirect_to root_path, notice: "See you next time!"
  end 

  def completed_quizzes

    #@completed_quiz = current_user.quiz_taken
    #User.find_by_id(current_user).quiz_taken
  end 

  def created_quizzes
    @created_quiz = current_user.quizzes
  end
  
  private

  def user_params
    params.require(:user).permit(
      :nickname,                                      
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def find_user
    @user = current_user
  end

end
