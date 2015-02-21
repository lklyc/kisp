class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You're In"
      redirect_to :back
    else
      flash[:error] = "Incorrect email or password"
      redirect_to :back
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You're Out"
    redirect_to root_path
  end

end