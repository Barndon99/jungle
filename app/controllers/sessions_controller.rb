class SessionsController < ApplicationController
  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
