class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @planner = Planner.find(params[:planner_id])
    @event_character = Character.find(@planner.character_id)
    @treasure = @event.treasures.first
  end

  def new
    @planner = Planner.find(params[:planner_id])
    @event = Event.new
  end

  def edit
    @planner = Planner.find(params[:planner_id])
  end

  def create
    @planner = Planner.find(params[:planner_id])
    @event = @planner.events.new(event_params)
      if @event.save
        redirect_to planner_event_path(@planner, @event), notice: 'Event was successfully created.'
      else
        render :new
    end
  end

  def update
    @planner = Planner.find(params[:planner_id])
      if @event.update(event_params)
        redirect_to planner_event_path(@planner, @event), notice: 'Event was successfully updated.'
      else
        render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    else
      render root_path
    end
  end

    def highest_xp
     @best_events = Event.highest_exp_events
    end

  private

    def set_event
      @event = Event.find(params[:id])
    end


    def event_params
      params.require(:event).permit(:name,
                                    :xp,
                                    :planner_id,
                                    treasures_attributes:
                                        %i[id name gold_value kind])
    end
end