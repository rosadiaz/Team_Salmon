class SessionsController < ApplicationController

def new 
end 

def create
    @user = User.find_by_email params[:session][:email]

    if @user&.authenticate(session_params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Signed in!"
        redirect_to root_path

    else 
        flash.now[:danger] = "Wrong credz, loser"
        render :new     
    end 
end 



def destroy 
    session[:user_id] =nil 
    redirect_to root_path, notice: "Signed out!"
end 

private 
def session_params 
    params.require(:session).permit(:email, :password)
end 

end
