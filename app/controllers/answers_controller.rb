class AnswersController < ApplicationController
  before_action :require_user
  before_action :require_student, only: [:new, :create]
  before_action :require_admin, only: [:destroy]

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @exam = Exam.find(session[:exam_id])
    @answer = @exam.answers.build
  end

  def create
    @exam = Exam.find(session[:exam_id])
    @answer = @exam.answers.build(answer_params)
    @answer.student_id = current_student.id

    if DateTime.current >= @exam.date && DateTime.current <= @exam.end_date
      if @answer.save
        flash[:success] = "Your answer was successfully saved"
        redirect_to student_path(current_student)
        session[:exam_id] = nil
      else
        render :new
      end
    else
      flash[:error] = "Sorry you could not submit your answer before the end date and time"
      redirect_to student_path(current_student)
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    if @answer.destroy
      flash[:success] = "Answer was successfully deleted"
      redirect_to answers_path
    else
      flash[:error] = "Answer couldn't be deleted"
      redirect_to answer_path(@answer)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
