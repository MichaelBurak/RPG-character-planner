class PlannersController < ApplicationController
  before_action :set_character, only: [:show]
  before_action :set_planner, only: [:show]

  def show
    authorize @planner
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

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_planner
    @planner = @character.planner
  end

end
