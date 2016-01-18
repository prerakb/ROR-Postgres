class BoatsController < ApplicationController
  def show
  	@boat  = Boat.find(params[:id])
  end

  def new
  	@boat = Boat.new
  end

  def create
  	@boat = Boat.new(boat_params)
  	@boat.user_id = current_user.boats.build(boat_params)
  	if @boat.save
  	redirect_to @user
    else
    redirect_to boats_new_path
	end
  end

  private
  def boat_params
  	params.require(:boat).permit(:name, :containers, :location)
  end
end
