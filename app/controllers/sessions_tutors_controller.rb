class SessionsTutorsController < ApplicationController
  def new
  end

  def create
    tutor = Tutor.find_by(name: params[:sessions_tutor][:name])
    if tutor && tutor.authenticate(params[:sessions_tutor][:password])
      session[:tutor_id] = tutor.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end
end
