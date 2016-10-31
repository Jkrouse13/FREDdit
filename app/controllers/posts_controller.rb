class PostsController < ApplicationController

  before_action :find_post, only: [:vote, :link_vote, :down_vote]
  # before_action :require_logged_in, except: [:index, :link_vote]

  def index
    @posts = Post.order(vote_count: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.vote_count = @post.votes.count
    if current_user.posts << @post
      @post.votes << Vote.create!(user_id: @post.user_id, post_id: @post.id)
      @post.vote_count = @post.votes.count
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def vote
    if current_user
      @post.votes << Vote.create!(user_id: @post.user_id, post_id: @post.id)
      @post.vote_count = @post.votes.count
      @post.save
      redirect_to :root
    else
      flash[:warning] = "You must be logged in to vote!"
      redirect_to :login
    end
  end

  def link_vote
    @post.votes << Vote.create!(user_id: @post.user_id, post_id: @post.id)
    @post.vote_count = @post.votes.count
    @post.save
    redirect_to @post.link
  end

  def down_vote
    if logged_in?
      @post.votes.last.destroy
      @post.vote_count = @post.votes.count
      @post.save
      redirect_to :root
      else
        flash[:warning] = "You must be logged in to down vote!"
        redirect_to :login
    end
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
    repost.increment!(:vote)
    redirect_to :root
  end

end
