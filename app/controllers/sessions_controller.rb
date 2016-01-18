class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(username: params[:username]).first
  	if @user && @user.authenticate(params[:password])
  		redirect_to @user
  	else
  		redirect_to root_path
  	end
  end
end
