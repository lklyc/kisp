class BriefsController < ApplicationController
  before_action :require_user

  def new
    @brief = Brief.new
    @article = Article.find(params[:article_id])
  end

  def create
    @brief = Brief.new(briefs_params)
    @article = Article.find(params[:article_id])
    @brief.user = current_user
    @brief.article = @article

    if @brief.save
      flash[:success] = 'Brief has been created'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @brief = Brief.find(params[:id])
    @article = Article.find(params[:article_id])
  end

  def update
    @brief = Brief.find(params[:id])
    @article = Article.find(params[:article_id])
    if @brief.update(briefs_params)
      flash[:success] = "Brief has been updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private

  def briefs_params
    params.require(:brief).permit(:body)
  end

end