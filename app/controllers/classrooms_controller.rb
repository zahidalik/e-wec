class ClassroomsController < ApplicationController
  before_action :require_tutor
  before_action :require_admin, only: [:new, :create]

  def index
    @classrooms = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(tutor_id: params[:tutor][:tutor_id],
                              standard_id: params[:standard][:standard_id],
                              subject_id: params[:subject][:subject_id])

    if @classroom.save
      flash[:success] = "New classroom was successfully created"
      redirect_to classrooms_path
    else
      render :new
    end
  end

end
