class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.preload(:players).last
  end
end
