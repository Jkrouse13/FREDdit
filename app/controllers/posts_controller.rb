class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :vote]

  def index
    @posts = Post.order(vote: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.vote = 1
    @post.save
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def vote
    @post.vote += 1
    @post.save
    redirect_to :root
  end

  def edit
    render :new
  end

  def update
    @post.update(post_params)
    @post.save
    redirect_to :root
  end

private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :link, :author)
  end


end
