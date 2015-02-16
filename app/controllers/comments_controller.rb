class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    @user = User.first
    @article = Article.find(params[:article_id])

    @comment.user = @user
    @comment.article = @article

    if @comment.save
      flash[:success] = 'Comment created'
    end

    redirect_to :back
  end

end