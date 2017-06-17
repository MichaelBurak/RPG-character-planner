class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy, :experience, :attribute_selection, :levelup]
  before_action :confirm_user, only: [:update, :destroy]

  def index
    @characters = Character.all
  end

  def show() end

  def new
    @character = Character.new
  end

  def edit() end

  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id
      if @character.save
        redirect_to @character, notice: 'Character was successfully created.'
      else
        render :new
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
    if @character.destroy
      redirect_to characters_url, notice: 'Character was successfully destroyed.'
    else
      render root_path
    end
  end

  def experience
    @character.add_event_xp
    if @character.level_up
      redirect_to character_levelupdate_path
    else redirect_to @character
      end
    end

    def attribute_selection

    end



      #if @character.update(character_params)
         #@validate_level = true
        #redirect_to @character, notice: 'Character was successfully updated.'
      #else
        #render :experience
      #end
    #end
    #end

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
