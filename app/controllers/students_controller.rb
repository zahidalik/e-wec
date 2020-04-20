class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :correct_student, only: [:edit, :update]
  before_action :require_admin, only: [:index, :new, :create, :destroy]

  def index
    @students = Student.all
  end

  def show
    @student_standard = @student.standards.last
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
      render :edit
    end
  end

  def destroy
    StandardStudent.where(student_id: @student.id).first.delete
    @student.destroy
    flash[:success] = "Student's record has been deleted"
    redirect_to students_url
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def correct_student
    @student = Student.find(params[:id])
    redirect_to root_path unless current_student?(@student)
  end

  def student_params
    params.require(:student).permit(:name, :address, :contact, :gender,
                   :father_name, :mother_name, :guardian_name, :password,
                   standard_ids: [])
  end
end
