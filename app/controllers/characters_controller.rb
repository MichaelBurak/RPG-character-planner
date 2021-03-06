class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy experience attribute_selection level_up expand]
  before_action :perform_authorization, only: %i[attribute_selection destroy experience level_up update]

  def index
    @characters = Character.order("id ASC")
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @characters}
    end
  end

  def new
    @character = Character.new
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

#On the show page, when calling for the html version, render the appropriate view.
#When calling for the .json version of the page, render @character as set by set_character
#as JSON using AMSerializer.

  def show
    respond_to do |format|
      format.js
      format.json {render json: @character}
      format.html {render :show}
    end
  end

  def edit()
  end


  def update
    @character.skip_level_validation = true
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

    #Render the appropriate character as a JSON object on this page, but only the attributes
    #that have not been displayed on the index page, that are to be displayed with the
    #'more info' button.

    def expand
      render json: @character.to_json(only: [:subtle, :powerful, :resistant, :level, :xp])
    end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :subtle, :powerful, :resistant, :level,
      :xp, :user_id, :just_leveled_up)
    end

    def perform_authorization
      authorize @character
    end

end
