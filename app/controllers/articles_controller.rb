class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)

    if @article.save
      flash[:success] = 'Article created.'
      redirect_to root_path
    else
      flash[:error] = "Failed to create article"
      render :new
    end
  end

  private 

  def articles_params
    params.require(:article).permit(:title,:url,:published_on,:author)
  end

end