class CommentsController < ApplicationController
  before_action get_article
  
  def create
    @comment = Comment.create! text: params[:comment][:text], article: @article, user: current_user
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    
    if @comment.destroy
      flash[:danger] = "Comment Deleted Successfully"
      redirect_to article_path(@comment.article)
    else
      redirect_to article_path(@comment.article)
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:text)
    end
    def get_article
      @article = Article.find(params[:article_id]
    end
  # End Of Private
end
