class OauthController < ApplicationController

  before_filter :authenticate_user!, :only => :authorize
  # Skips CSRF check
  skip_before_filter :verify_authenticity_token 

  def authorize
    application = Application.find_by_client_id(params[:client_id])
    access_grant = current_user.access_grants.find_or_create_by_application_id(application.id)
    redirect_to access_grant.redirect_uri_for(params[:redirect_uri])
  end

  def access_token
    application = Application.authenticate(params[:client_id], params[:client_secret])
    unless application
      Rails.logger.warn('Invalid application')
      render :json => {:error => 'Could not find Application'}
      return
    end

    access_grant = AccessGrant.authenticate(params[:code], application) 
    unless access_grant
      Rails.logger.warn('Invalid access token')
      render :json => {:error => 'Could not authenticate access token'} 
      return
    end

    access_grant.start_expiry_period!
    Rails.logger.info('Access Granted')
    render :json => { :access_token => access_grant.access_token,
                      :refresh_token => access_grant.refresh_token,
                      :expires_in => access_grant.expires_at }
  end

  def user

  end


end
