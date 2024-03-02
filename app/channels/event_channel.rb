class EventChannel < ApplicationCable::Channel
  def subscribed
    event = Event.find(params[:id])
    stream_for event
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
