class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy, :experience, :attribute_selection, :level_up]

  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def edit
    if @character.just_leveled_up?
      @character.update_attribute(:just_leveled_up, nil)
    end
  end

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
    event = Event.find(params[:event])
    if @character.add_event_xp(event)
      if @character.just_leveled_up?
      redirect_to character_attributes_path
    else
      redirect_to @character
    end
  end
  end

    def attribute_selection
      @character.attribute_ceiling
    end

    def level_up
      if @character.update(character_params)
        redirect_to @character, notice: 'Character was successfully updated.'
      else
        render 'attribute_selection'
      end
    end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :subtle, :powerful, :resistant, :level,
      :xp, :user_id, :just_leveled_up)
    end

end
