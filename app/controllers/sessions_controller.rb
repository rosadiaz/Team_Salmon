class SessionsController < ApplicationController

def new 
end 

def create
    user = User.find_by_email params[:email]
    sesions[:user_id] = user.id
    redirect_to root_path, notice: "Signed in!"
end 


private 
def session_params 
    params.require(:session).permit(:nickname, :password)
end 

end
