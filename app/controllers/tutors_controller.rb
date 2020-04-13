class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_admin, only: [:index, :new, :create, :destroy]

  def index
    @tutors = Tutor.all
  end

  def show
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      flash[:success] = "Tutor was successfully added"
      redirect_to @tutor
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
    @tutor.destroy
    flash[:success] = "Tutor record has been deleted"
    redirect_to tutors_url
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def require_admin
    if !current_tutor.admin?
      flash[:error] = "You are not authorised to do this action"
      redirect_to root_path
    end
  end

  def tutor_params
    params.require(:tutor).permit(:name, :contact, :address, :password)
  end
end
