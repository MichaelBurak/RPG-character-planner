class PlannersController < ApplicationController

  def show
    @character = Character.find(params[:character_id])
    @planner = @character.planner
    @events = @planner.events
  end

  def create
    @character = Character.find(params[:character_id])
    @user = current_user
    @planner = Planner.new(:character_id => @character.id, :user_id => @user.id)
      if @planner.save
        redirect_to character_planner_path(@character, @planner), notice: 'Planner was successfully created.'
      else
        render :new
    end
    end

end
