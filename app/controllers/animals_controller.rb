class AnimalsController < ApplicationController
  def new
    @animal = Animal.new
  end

  def index
    matching_animals = Animal.all

    @list_of_animals = matching_animals.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @list_of_animals
      end

      format.html 
    end
  end

  def show
    @animal = Animal.find(params.fetch(:id))

  end

  def create
    animal_attributes = params.require(:animal).permit(:name, :appearance)
    @animal = Animal.new(animal_attributes)

    if @animal.valid?
      @animal.save
      redirect_to animals_url, notice: "animal created successfully."
    else
      render template: "new"
    end
  end

  def edit
    @animal = Animal.find(params.fetch(:id))

  end

  def update
    @animal = Animal.find(params.fetch(:id))
    animal_attributes = params.require(:animal).permit(:name, :appearance)
    @animal.update(animal_attributes)

    if @animal.valid?
      @animal.save
      redirect_to animal_url(@animal), notice: "animal updated successfully."
    else
      redirect_to animal_url(@animal), alert: "animal failed to update successfully."
    end
  end

  def destroy
    @animal = Animal.find(params.fetch(:id))

    @animal.destroy

    redirect_to animals_url, notice: "animal deleted successfully."
  end
end
