class ConceptsController < ApplicationController
  def index
    @concept = Concept.all
  end

  def new
    @concept = Concept.new
  end

  def edit
    @concept = Concept.find(params[:id])
  end

  def create
    @concept = Concept.new(concepts_params)
    @concept.user = current_user

    if @concept.save
      flash[:success] = "Concept created."
      redirect_to concepts_path
    else
      flash[:error] = "Failed to create Concept"
      render :new
    end
  end

  def update
    @concept = Concept.find(params[:id])
    if @concept.update(concepts_params)
      flash[:success] = "Concept has been updated"
      redirect_to concept_path(@concept)
    else
      render :edit
    end
  end

  def show
    @concept = Concept.find(params[:id])
  end

  private

  def concepts_params
    params.require(:concept).permit(:concept,:context)
  end
end