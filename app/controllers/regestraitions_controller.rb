class RegestraitionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:email].downcase.strip)
    if @user
      session[:user_id] = @user.id
      redirect_to(root_path)
    else 
      redirect_to(new_regestrations_path)
    end
  end

  def destroy
    redirect_to new_regestrations_path, notice: "You need to be logged in in order to log out" and return if !session[:user_id]
    reset_session
    redirect_to new_regestrations_path
  end
end
