class TreasuresController < ApplicationController
  def edit
    @event = Event.find(params[:event_id])
    @planner = Planner.find(params[:planner_id])
    @treasure = Treasure.find(params[:id])
  end

  def update
    @planner = Planner.find(params[:planner_id])
    @event = Event.find(params[:event_id])
    @treasure = Treasure.find(params[:id])
    if @treasure.update(treasure_params)
      redirect_to planner_event_path(@planner, @event)
    else
      render :edit
    end
  end
end

private

  def treasure_params
    params.require(:treasure).permit(%i[id name gold_value kind])
end
