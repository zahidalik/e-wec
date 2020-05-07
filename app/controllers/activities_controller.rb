class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :destroy]
  before_action :set_classroom, only: [:new, :create]
  before_action :require_tutor, except: [:show]
  before_action :require_admin, only: [:index, :destroy]

  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = @classroom.activities.build
  end

  def create
    @activity = @classroom.activities.build(activity_params)

    if @activity.save
      flash[:success] = "Activity has been created successfully"
      redirect_to activity_path(@activity)
      session[:classroom_id] = nil
    else
      render :new
    end
  end

  def destroy
    @activity.delete
    flash[:success] = "Activity deleted succcessfully"
    redirect_to classrooms_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_classroom
    @classroom = Classroom.find(session[:classroom_id])
  end

  def activity_params
    params.require(:activity).permit(:topic, :activity, :activity_video, :activity_audio, :activity_file)
  end
end
