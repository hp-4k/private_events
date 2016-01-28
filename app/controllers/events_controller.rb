class EventsController < ApplicationController
  before_action :require_login, only: [:new, :show, :index]
  
  def show
    @event = Event.find(params[:id])
  end
  
  def index
    @events = Event.all
  end
  
  def new
    @event = current_user.events.build
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :location, :description,
                                    :date, :time)
    end
  
end
