class OpinionsController < ApplicationController
  def index
    
  end
  
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinions_params)
    @opinion.user = current_user

    if @opinion.save
      flash[:success] = "Opinion created."
      redirect_to events_path
    else
      flash[:error] = "Failed to create opinion"
      render :new
    end
  end

  private

  def opinions_params
    params.require(:opinion).permit(:x,:y)
  end
end