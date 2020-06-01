class LiveSessionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "live_session_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
