class ApplicationController < ActionController::Base
  helper_method :current_tutor, :current_student, :tutor_logged_in?, :student_logged_in?

  def current_tutor
    @current_tutor ||= Tutor.find(session[:tutor_id]) if session[:tutor_id]
  end

  def current_tutor?(tutor)
    tutor == current_tutor
  end

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def current_student?(student)
    student == current_student
  end

  def tutor_logged_in?
    !!current_tutor
  end

  def student_logged_in?
    !!current_student
  end

  def require_tutor
    if !tutor_logged_in?
      flash[:error] = "You must be logged in as tutor for performing this action"
      redirect_to root_path
    end
  end

  def require_student
    if !student_logged_in?
      flash[:error] = "You must be logged in as a student for performing this action"
      redirect_to root_path
    end
  end

  def require_admin
    if session[:student_id]
      flash[:error] = "You are not authorised to do this action"
      redirect_to root_path
    elsif session[:tutor_id]
      if !current_tutor.admin?
        flash[:error] = "You are not authorised to do this action"
        redirect_to root_path
      end
    end
  end

  def require_user
    if tutor_logged_in?
      return
    elsif student_logged_in?
      return
    else
      flash[:error] = "You must be logged in before performing this action"
      redirect_to root_path
    end
  end
end
