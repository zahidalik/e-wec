class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_admin, only: [:new, :create, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Student was successfully added"
      redirect_to @student
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:success] = "The account was updated successfully"
      redirect_to @student
    else
      render :new
    end
  end

  def destroy
    @student.destroy
    flash[:success] = "Student's record has been deleted"
    redirect_to students_url
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :address, :contact, :gender,
                   :father_name, :mother_name, :guardian_name, :password)
  end
end
