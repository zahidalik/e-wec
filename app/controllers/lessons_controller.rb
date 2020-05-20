class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :set_classroom, only: [:new, :create]
  before_action :require_tutor, except: [:show]
  before_action :require_admin, only: [:index, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def new
    @lesson = @classroom.lessons.build
  end

  def create
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
    flash[:success] = "Lesson deleted succcessfully"
    redirect_to classrooms_path
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_classroom
    @classroom = Classroom.find(session[:classroom_id])
  end

  def lesson_params
    params.require(:lesson).permit(:topic, :lesson, :video, :audio, :file)
  end
end
