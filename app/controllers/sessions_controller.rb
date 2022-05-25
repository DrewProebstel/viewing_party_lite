class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.name}"
        redirect_to user_dashboard_path(@user)
      else
        flash[:error] = 'Invalid Entry'
        render 'new'
      end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
