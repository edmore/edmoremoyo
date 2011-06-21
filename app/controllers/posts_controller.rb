class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :overview]
  before_filter :load_user
  before_filter :load_post
  before_filter :load_posts

  def index
  end

  def edit
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

  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post successfully updated.'
      redirect_to posts_path
    else
      render :action => :edit, :id => @post.id
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post successfully deleted.'
    else
      flash[:error] = 'Post could not be deleted.'
    end
      redirect_to posts_path
  end

  private
  def load_user
    @user = current_user
  end

  def load_post
    @post = Post.find_by_permalink(params[:id]) if params[:id]
  end

  def load_posts
    @posts = Post.ordered_by("created_at DESC")
  end


end
