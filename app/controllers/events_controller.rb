class EventsController < ApplicationController
  def index
    
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    @event.user = current_user

    if @event.save
      flash[:success] = "Event created."
      redirect_to events_path
    else
      flash[:error] = "Failed to create event"
      render :new
    end
  end

  private

  def events_params
    params.require(:event).permit(:who,:what,:when,:where,:why,:source)
  end
end