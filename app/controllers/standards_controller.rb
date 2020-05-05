class StandardsController < ApplicationController
  before_action :set_standard, only: [:show, :edit, :update]
  before_action :require_tutor
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def index
    @standards = Standard.all
  end

  def new
    @standard = Standard.new
  end

  def create
    @standard = Standard.new(standard_params)

    if @standard.save
      flash[:success] = "New class has been created successfully"
      redirect_to standards_url
    else
      render :new
    end
  end

  def show
    @standard_students = @standard.students
    session[:standard_id] = @standard.id
    @standard_associations = Classroom.where(standard_id: @standard.id)
  end

  def edit
  end

  def update
    if @standard.update(standard_params)
      flash[:success] = "Class has been updated successfully"
      redirect_to @standard
    else
        render :edit
    end
  end

  private

  def set_standard
    @standard = Standard.find(params[:id])
  end

  def require_tutor
    if !tutor_logged_in?
      flash[:error] = "You can't perform this action"
      redirect_to root_path
    end
  end

  def standard_params
    params.require(:standard).permit(:name)
  end
end
