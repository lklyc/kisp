class EventsController < ApplicationController
  def index
    @event = Event.all
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

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_params)
      flash[:success] = "Article has been updated"
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  private

  def events_params
    params.require(:event).permit(:who,:what,:when,:where,:why,:source)
  end
end