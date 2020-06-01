class LiveSessionsController < ApplicationController
  before_action :require_user
  before_action :require_tutor, only: [:new, :create]
  before_action :require_admin, only: [:index]

  def index
    @live_sessions = LiveSession.all
  end

  def show
    @live_session = LiveSession.find(params[:id])
    if @live_session.end_date < DateTime.current
      flash[:error] = "Your live session has finished"
      redirect_to root_path
    end
    # head :no_content
    ActionCable.server.broadcast "live_session_channel", live_session_broadcast_params
  end

  def new
    @classroom = Classroom.find(session[:classroom_id])
    @live_session = @classroom.live_sessions.build
  end

  def create
    @classroom = Classroom.find(session[:classroom_id])
    @live_session = @classroom.live_sessions.build(start_date: params[:live_session][:start_date],
                                                  end_date: params[:live_session][:end_date],
                                                  classroom_id: session[:classroom_id])

    if @live_session.save
      flash[:success] = "Link to your live session will be shown at the given Start Time"
      redirect_to tutor_path(current_tutor)
      session[:classroom_id] = nil
    else
      render 'new'
    end
  end

  private

  def live_session_broadcast_params
    params.permit(:live_session, :type, :from, :to, :sdp, :candidate)
  end
end
