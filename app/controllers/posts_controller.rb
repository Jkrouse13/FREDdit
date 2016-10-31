class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :vote, :link_vote, :down_vote]

  def index
    @posts = Post.order(vote: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.vote = 1
    @post.user = current_user
    if current_user.posts << @post
      redirect_to root_path
    else
      render :new
    end
  end

  def vote
    @post.increment!(:vote, by = 1)
    redirect_to :root
  end

  def link_vote
    @post.increment!(:vote, by = 1)
    redirect_to @post.link
  end

  def down_vote
    @post.increment!(:vote, by = -1)
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
    params.require(:post).permit(:title, :link, :summary, :subfred_id)
  end

  def non_unique_link
    repost = Post.find_by(link: @post.link)
    repost.increment!(:vote, by = 1)
    redirect_to :root
  end

end
