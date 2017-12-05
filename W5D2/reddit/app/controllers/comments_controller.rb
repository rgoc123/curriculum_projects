class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_url(@comment.post)
    else 
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_url(@comment.post)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
