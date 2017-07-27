class TreasuresController < ApplicationController
  before_action :set_planner_treasure_event

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

  def set_planner_treasure_event
    @planner = Planner.find(params[:planner_id])
    @event = Event.find(params[:event_id])
    @treasure = Treasure.find(params[:id])
  end

  def treasure_params
    params.require(:treasure).permit(%i[id name gold_value kind])
  end

  end
