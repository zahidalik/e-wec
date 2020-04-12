class SessionsStudentsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(name: params[:sessions_student][:name])
    if student && student.authenticate(params[:sessions_student][:password])
      session[:student_id] = student.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end
end
