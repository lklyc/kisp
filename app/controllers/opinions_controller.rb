class OpinionsController < ApplicationController
  def index
    @opinion = Opinion.all
  end
  
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinions_params)
    @opinion.user = current_user

    if @opinion.save
      flash[:success] = "Opinion created."
      redirect_to opinions_path
    else
      flash[:error] = "Failed to create opinion"
      render :new
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def edit
    @opinion = Opinion.find(params[:id])
    #@article = Article.find(params[:article_id])
  end

  def update
    @opinion = Opinion.find(params[:id])
    if @opinion.update(opinions_params)
      flash[:success] = "Article has been updated"
      redirect_to opinion_path(@opinion)
    else
      render :edit
    end
  end

  private

  def opinions_params
    params.require(:opinion).permit(:x,:y)
  end
end