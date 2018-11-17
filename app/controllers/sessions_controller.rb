class SessionsController < ApplicationController

def new 
end 

def create
    @user = User.find_by_email params[:session][:email]

    if @user&.authenticate(session_params[:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Signed in!"

    else 
        puts "didn't log in ======================"
        flash.now[:danger] = "Wrong credz, loser"
        
        redirect_to new_session_path, notice: "Wrong Credz!"

    
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
