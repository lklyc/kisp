class ConceptsController < ApplicationController
  def index
    
  end

  def new
    @concept = Concept.new
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

  private

  def concepts_params
    params.require(:concept).permit(:concept,:context)
  end
end