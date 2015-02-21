class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    @user = current_user
    @article = Article.find(params[:article_id])

    @comment.user = @user
    @comment.article = @article

    if @comment.save
      flash[:success] = 'Comment created'
    end

    redirect_to :back
  end

end