class SubjectsController < ApplicationController
  before_action :require_tutor, only: [:index]
  before_action :require_user, only: [:show]
  before_action :require_admin, only: [:new, :create]

  def index
    @tutor_subjects = Classroom.all
  end

  def show
    @subject = Subject.find(params[:id])
    @subject_classrooms = Classroom.where(subject_id: @subject.id, tutor_id: current_tutor.id)
    @subject_in_all_classrooms = Classroom.where(subject_id: @subject.id)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Subject was successfully created"
      redirect_to tutor_path(current_tutor)
    else
      render :new
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
