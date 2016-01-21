class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
  	@job = Job.new
  end

  def create
    if current_user
      	@job = Job.new(job_params)
        if @job.save
          redirect_to user_path(current_user)
        else
          render "new"
        end
    else
      redirect_to login_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
  	@job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      redirect_to user_path(current_user)
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
