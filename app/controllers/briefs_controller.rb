class BriefsController < ApplicationController
  def new
    @brief = Brief.new
    @article = Article.find(params[:article_id])
  end

  def create
    @brief = Brief.new(briefs_params)
    @article = Article.find(params[:article_id])
    @brief.user = User.first
    @brief.article = @article

    if @brief.save
      flash[:success] = 'Brief has been created'
      redirect_to :back
    else
      render :new
    end
  end

  private

  def briefs_params
    params.require(:brief).permit(:body)
  end

end