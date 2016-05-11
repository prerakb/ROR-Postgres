class UsersController < ApplicationController
	  def show
	  @user = User.find(params[:id])	  
	  end

	  def new
	  	@user = User.new
	  end

	  def create
	  	@user = User.new(user_params)
		  if @user.save
		  session[:user_id] = @user.id
		  redirect_to login_path
		  flash[:notice] = "Sign up Successful!"
		  else
		  redirect_to :back
		  flash[:notice] = "Sign up failed!"
		  end
	  end

	  private
	  def user_params
	  	params.require(:user).permit(:name, :username, :password)
	  end
end
