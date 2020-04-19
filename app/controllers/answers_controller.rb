class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update]
  before_action :require_user, only: [:show]
  before_action :require_student, except: [:show]

  def show
  end

  def new
    @answer = current_student.answers.build
  end

  def create
    @answer = current_student.answers.build(answer_params)

    if @answer.save
      flash[:success] = "#{current_student.name} your answer was saved successfully"
      redirect_to student_path(current_student)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = "#{current_student.name} your answer was edited successfully"
      redirect_to student_path(current_student)
    else
      render :edit
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:subject, :topic, :answer)
  end
end
