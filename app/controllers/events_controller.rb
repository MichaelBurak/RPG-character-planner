class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @planner = Planner.find(params[:planner_id])
    @event_character = Character.find(@planner.character_id)
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
    raise.params.inspect
    respond_to do |format|
      if @event.save
        format.html { redirect_to planner_event_path(@planner, @event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @planner = Planner.find(params[:planner_id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to planner_event_path(@planner, @event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
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
                                        %i[id name gold_value type])
    end
end