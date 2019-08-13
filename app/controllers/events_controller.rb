class EventsController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :new]}
  before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}

  def index
    @events = Event.all.order(created_at: :desc)
  end

  def show
    @event = Event.find_by(id: params[:id])
    @user = @event.user
  end

  def new
     @event = Event.new
  end
  
  def create
    @event = Event.new(event_name: params[:event_name], 
                      date: params[:date], 
                      content: params[:content],
                      user_id: @current_user.id,
                      event_image: "default_event.jpg"
                      )

    if params[:image]
      @event.event_image = "#{@event.id}.jpg"
      image = params[:image]
      File.binwrite("public/event_images/#{@event.event_image}", image.read)
    end


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

    if params[:image]
      @event.event_image = "#{@event.id}.jpg"
      image = params[:image]
      File.binwrite("public/event_images/#{@event.event_image}", image.read)
    end

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
  
  def ensure_correct_user
    @event = Event.find_by(id: params[:id])
    if @event.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/events/index")
    end
  end

end