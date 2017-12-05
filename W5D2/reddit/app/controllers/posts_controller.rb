class PostsController < ApplicationController
  before_action :ensure_author, only: [:update, :destroy]
  def new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    debugger
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subs_url
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [] )
  end
  
  def ensure_author
    @post = Post.find(params[:id])
    unless current_user == @post.author
      redirect_to post_url(@post) 
      flash.now[:errors] = ['You do not author this post']
    end
  end
end
