class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    render
  end
  
  def update
    if profile.update_attributes(params[:user])
      redirect_to profile_path, :notice => "Look at you, you updated your profile like a champ!"
    else
      render :show, :notice => "Oh ho, something went booboo."
    end
  end
  
  #give this method over to the view, so the view can use it
  helper_method :profile
  
  private
    def profile
      current_user
    end
    
end
