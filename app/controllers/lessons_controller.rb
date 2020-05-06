class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :require_tutor, except: [:show]
  before_action :require_admin, only: [:destroy]
  def show
  end

  def new
    @classroom = Classroom.find(session[:classroom_id])
    @lesson = @classroom.lessons.build
  end

  def create
    @classroom = Classroom.find(session[:classroom_id])
    @lesson = @classroom.lessons.build(lesson_params)

    if @lesson.save
      flash[:success] = "Lesson has been created succcessfully"
      redirect_to lesson_path(@lesson)
      session[:classroom_id] = nil
    else
      render :new
    end
  end

  def edit
    @classroom = @lesson.classroom
  end

  def update
    if @lesson.update(lesson_params)
      flash[:success] = "Lesson updated succcessfully"
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @lesson.delete
    flash[:success] = "Activity deleted succcessfully"
    redirect_to standards_url
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:topic, :lesson, :video, :audio, :file)
  end
end
