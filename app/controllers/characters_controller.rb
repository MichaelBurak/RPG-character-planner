class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :confirm_user, only: [:edit, :update, :destroy, :experience]

  def index
    @characters = Character.all
  end

  def show() end

  def new
    @character = Character.new
  end

  def edit
  end

  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id
      if @character.save
        redirect_to @character, notice: 'Character was successfully created.'
      else
        render :new
        #add validations
      end
    end

  def update
      if @character.update(character_params)
        redirect_to @character, notice: 'Character was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def experience
    @character = Character.find(params[:id])
    @character.total_xp
    redirect_to @character
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :subtle, :powerful, :resistant, :level,
      :xp, :user_id)
    end

    def confirm_user
      if current_user != @character.user_id
        redirect_to root_path
      end
    end

end
