class BoatsController < ApplicationController
  def show
  	@boat = Boat.find(params[:id])
  end

  def new
  	@boat = Boat.new
  end

  def create
  	if current_user
        @boat = Boat.new(boat_params)
        if @boat.save
         redirect_to user_path(current_user)
        else
         render "new"
        end
    else
      redirect_to login_path    
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update_attributes(boat_params)
      redirect_to user_path(current_user)
    else render edit_boat(@boat)
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.delete
    redirect_to :back
  end

  private
  def boat_params
  	params.require(:boat).permit(:name, :containers, :location).merge(user_id: current_user.id)
  end
end
