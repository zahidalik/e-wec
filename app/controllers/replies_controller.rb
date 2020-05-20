class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update]
  before_action :require_user
  before_action :require_student, only: [:new, :create, :edit, :update]
  before_action :require_admin, only: [:index]

  def index
    @replies = Reply.all
  end

  def show
  end

  def new
    @activity = Activity.find(session[:activity_id])
    @reply = @activity.replies.build
  end

  def create
    @activity = Activity.find(session[:activity_id])
    @reply = @activity.replies.build(reply_params)
    @reply.student_id = current_student.id

    if @reply.save
      flash[:success] = "Reply for the activity was created successfully"
      redirect_to student_path(current_student)
      session[:activity_id] = nil
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reply.update(reply_params)
      flash[:success] = "Your reply has been updated successfully"
      redirect_to reply_path(@reply)
    else
      render 'edit'
    end
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:topic, :reply, :reply_audio, :reply_file)
  end
end
