class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'Post Added!'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Your Post Was Updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  protected

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
