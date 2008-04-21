class UsersController < ApplicationController

  def new
    @user = User.new(params[:user])
  end

  def create
    cookies.delete :auth_token
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end
