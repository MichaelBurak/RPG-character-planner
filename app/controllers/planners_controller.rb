class PlannersController < ApplicationController
  def show
    @character = Character.find(params[:character_id])
    @planner = Planner.find(params[:id])
    @events = Event.all
  end

  def new
  end

  def edit
  end

  def create
    @character = Character.find(params[:character_id])
    @user = current_user
    @planner = Planner.new(:character_id => @character.id, :user_id => @user.id)
    respond_to do |format|
      if @planner.save
        format.html { redirect_to character_planner_path(@planner), notice: 'Planner was successfully created.' }
        format.json { render :show, status: :created, location: @planner }
      else
        format.html { render :new }
        format.json { render json: @planner.errors, status: :unprocessable_entity }
      end
    end
    end

  def update
  end

  def destroy
  end
end
