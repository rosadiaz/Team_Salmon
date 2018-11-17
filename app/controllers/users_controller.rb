class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy, :completed_quizzes]


    def new
        @user = User.new
    end

    def create
        @user = User.new user_params
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path, notice: "Thank you for signing up!"
        else
          render :new
        end
    end

    def show 


    end 


    def completed_quizzes


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
