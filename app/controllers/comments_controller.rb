class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article = Article.find(params[:article_id])
    @comment.user = current_user
    if @comment.save()
      flash[:success] = "Comment added successfully"
      redirect_to article_path(@comment.article)
    else
      flash[:danger] = "Something went terribly wrong"
      redirect_to article_path(@comment.article)
    end
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
  # End Of Private
end
