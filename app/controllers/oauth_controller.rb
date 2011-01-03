class OauthController < ApplicationController

  before_filter :authenticate_user!, :only => :authorize

  def authorize
    access_grant = current_user.access_grants.create(:application => application)
    redirect_to access_grant.redirect_uri(params[:redirect_uri])
  end

  def access_token
    application = Application.authenticate(params[:client_id], params[:client_secret])
    unless application
      render :json => {:error => 'Could not find Application'}
      return
    end

    access_grant = AccessGrant.authenticate(params[:code], application) 
    unless access_grant
      render :json => {:error => 'Could not authenticate access token'} 
      return
    end

    access_grant.start_expiry_period!
    render :json => { :access_token => access_grant.access_token,
                      :refresh_token => access_grant.refresh_token,
                      :expires_in => access_grant.access_token_expires_at }
  end

  def user

  end

  private

  def application
    Application.find_by_slug(params[:application])
  end

end
