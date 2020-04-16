class StandardsController < ApplicationController

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
    @standard = Standard.find(params[:id])
    @standard_students = @standard.students
  end





  private

  def standard_params
    params.require(:standard).permit(:name)
  end
end
