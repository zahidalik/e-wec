class SubjectsController < ApplicationController
  before_action :require_admin

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
