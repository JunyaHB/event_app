class JoinsController < ApplicationController
  before_action :authenticate_user
  
  def create
    @join = Join.new(
      user_id: @current_user.id,
      event_id: params[:event_id])
     @join.save
    redirect_to("/events/#{params[:event_id]}")
  end
  
  def destroy
    @join = Join.find_by(user_id: @current_user.id, event_id: params[:event_id])
    @join.destroy
    redirect_to("/events/#{params[:event_id]}")
  end
  
end