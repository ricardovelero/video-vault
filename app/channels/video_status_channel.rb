class VideoStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "video_status_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
