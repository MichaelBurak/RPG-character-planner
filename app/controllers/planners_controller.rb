class PlannersController < ApplicationController
  def show
    @character = Character.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
