class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :require_tutor, except: [:show]
  before_action :require_admin, only: [:destroy]
  def show
  end

  def new
    current_standard = Standard.find(session[:standard_id])
    @lesson = current_standard.lessons.build
  end

  def create
    current_standard = Standard.find(session[:standard_id])
    @lesson = current_standard.lessons.build(lesson_params)

    if @lesson.save
      flash[:success] = "Activity has been created succcessfully"
      redirect_to standards_url
      session[:standard_id] = nil
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      flash[:success] = "Activity updated succcessfully"
      redirect_to standards_url
    else
      render :edit
    end
  end

  def destroy
    @lesson.delete
    flash[:success] = "Activity delted succcessfully"
    redirect_to standards_url
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:subject, :topic, :description, :body)
  end
end
