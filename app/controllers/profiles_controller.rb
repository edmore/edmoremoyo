class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user
  before_filter :load_profile

  def update
    if @profile.update_attributes(params[:profile])
      flash[:notice] = 'Profile successfully updated.'
      redirect_to profile_path
    else
      render :action => :show
    end
  end


  def show
  end

  private
  def load_user
    @user = current_user
  end

  def load_profile
    @profile = Profile.first
  end


end
