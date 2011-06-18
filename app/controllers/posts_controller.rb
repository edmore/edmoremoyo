class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :overview]
  before_filter :load_user
  before_filter :load_post
  before_filter :load_posts

  def update
    #if @profile.update_attributes(params[:profile])
      #flash[:notice] = 'Profile successfully updated.'
      #redirect_to profile_path
    #else
      #render :action => :show
    #end
  end

  def index
  end

  def overview
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Post successfully created."
      redirect_to posts_path
    else
      render :action => "new"
    end
  end

  private
  def load_user
    @user = current_user
  end

  def load_post
    @post = Post.find(params[:id]) if params[:id]
  end

  def load_posts
    @posts = Post.ordered_by("created_at DESC")
  end


end
