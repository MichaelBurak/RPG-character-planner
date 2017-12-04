class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_planner, only: %i[show new edit create update destroy]
  before_action :perform_authorization, only: %i[show new edit create update destroy]

  def new
    @event = Event.new
    @event.treasures.build
  end

  def create
    @event = @planner.events.new(event_params)
    if @event.save
      render json: @event 
    else
      render :new
    end
  end

  def show
    @event_character = Character.find(@planner.character_id)
    @treasures = @event.treasures.all
  end

  def edit
  end


  def update
      if @event.update(event_params)
        redirect_to planner_event_path(@planner, @event), notice: 'Event was successfully updated.'
      else
        render :edit
    end
  end

  def destroy
    @event_character = Character.find(@planner.character_id)
    if @event.destroy
      redirect_to character_planner_path(@event_character,@planner), notice: 'Event was successfully destroyed.'
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

    def set_planner
      @planner = Planner.find(params[:planner_id])
    end

    def event_params
      params.require(:event).permit(:name,
                                    :xp,
                                    :planner_id,
                                    treasures_attributes:
                                        %i[id name gold_value kind])
    end

  def perform_authorization
    authorize @planner
  end

end
