class ExamsController < ApplicationController
  before_action :require_user

  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def new
    @classroom = Classroom.find(session[:classroom_id])
    @exam = @classroom.exams.build
  end

  def create
    @classroom = Classroom.find(session[:classroom_id])
    @exam = @classroom.exams.build(exam_params)

    if @exam.save
      flash[:success] = "Exam was successfully created"
      redirect_to tutor_path(current_tutor)
      session[:classroom_id] = nil
    else
      render 'new'
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:topic, :exam, :date, :end_date)
  end
end
