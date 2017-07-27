class TreasuresController < ApplicationController
  before_action :set_planner, only: %i[new edit update destroy create]
  before_action :set_event, only: %i[new edit update destroy create]
  before_action :set_treasure, only: %i[edit update destroy]

  def new
    @treasure = Treasure.new
  end

  def create
  @treasure = Treasure.new(treasure_params)
  @treasure.event_id = @event.id
  if @treasure.save
    binding.pry
    redirect_to planner_event_path(@planner, @event), notice: 'Treasure was successfully added.'
  else
    render :new
    end
  end


  def edit
  end

  def update
    if @treasure.update(treasure_params)
      redirect_to planner_event_path(@planner, @event), notice: 'Treasure was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @treasure.destroy
      redirect_to planner_event_path(@planner, @event), notice: 'Treasure was successfully destroyed.'
    else
      render root_path
    end
  end


private

  def set_planner
    @planner = Planner.find(params[:planner_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_treasure
    @treasure = Treasure.find(params[:id])
  end

  def treasure_params
    params.require(:treasure).permit(%i[id name gold_value kind])
  end

  end
