class PlannersController < ApplicationController
  def show
    @character = Character.find(params[:character_id])
  end

  def new
  end

  def edit
  end

  def create
    @character = Character.find(params[:id])
    @user = current_user
    @planner = Planner.new(params[@character, @user])
    respond_to do |format|
      if @planner.save
        format.html { redirect_to @planner, notice: 'Planner was successfully created.' }
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
