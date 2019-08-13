class EventsController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :new]}

  def index
    @events = Event.all.order(created_at: :desc)
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
     @event = Event.new
  end
  
  def create
    @event = Event.new(event_name: params[:event_name], date: params[:date], content: params[:content])
    if @event.save
      flash[:notice] = "Eventを立上げました"
      redirect_to("/events/index")  
    else
      render("events/new")
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.event_name = params[:event_name]
    @event.date = params[:date]
    @event.content = params[:content]

    if @event.save
      flash[:notice] = "Eventを修正しました"
      redirect_to("/events/index")
    else
      render("/events/edit")
    end
  end
  
  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy
    flash[:notice] = "Eventを中止しました"
    redirect_to("/events/index")
  end

end