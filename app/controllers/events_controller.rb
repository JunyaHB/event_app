class EventsController < ApplicationController

  def index
    @events = Event.all.order(created_at: :desc)
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
  end
  
  def create
    @event = Event.new(event_name: params[:event_name], date: params[:date], content: params[:content])
    @event.save
    redirect_to("/events/index")  
  end
  
end
