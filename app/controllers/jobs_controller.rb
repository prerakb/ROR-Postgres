class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])

  end

  def new
    @boat = Boat.find(params[:boat_id])
  	@job = Job.new
  end

  def create
    if current_user
      @boat = Boat.find(params[:boat_id])
      	@job = Job.new(job_params)
        if @job.save
          redirect_to boat_path(params[:boat_id])
        else
          render "new"
        end
    else
      redirect_to login_path
    end
  end

  def edit
    @boat = Boat.find(params[:boat_id])
    @job = Job.find(params[:id])
  end

  def update
  	@job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      redirect_to boat_path([@boat, @job])
    else render edit_job(@job)
    end
  end

  def destroy
    @job  = Job.find(params[:id])
    @job.delete
    redirect_to :back
  end

  private
  def job_params
    params.require(:job).permit(:origin, :destination, :contneeded, :cargo, :jobcost).merge(user_id: current_user.id)
  end
end
