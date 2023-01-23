class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.preload(:players).find(params[:id])
  end
end
