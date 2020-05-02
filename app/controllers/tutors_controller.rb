class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :correct_tutor, only: [:edit, :update]
  before_action :require_admin, only: [:index, :new, :create, :destroy]

  def index
    @tutors = Tutor.all
  end

  def show
    @tutor_standards = @tutor.standards
    @tutor_subjects = @tutor.subjects
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      session[:new_tutor_id] = @tutor.id
      flash[:success] = "Tutor was successfully added"
      redirect_to new_subject_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tutor.update(tutor_params)
      flash[:success] = "The account was updated successfully"
      redirect_to @tutor
    else
      render :new
    end
  end

  def destroy
    StandardTutor.where(tutor_id: @tutor.id).first.destroy
    @tutor.destroy
    flash[:success] = "Tutor record has been deleted"
    redirect_to tutors_url
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def correct_tutor
    @tutor = Tutor.find(params[:id])
    redirect_to root_path unless current_tutor?(@tutor)
  end

  def tutor_params
    params.require(:tutor).permit(:name, :contact, :address, :admin, :password)
  end
end
