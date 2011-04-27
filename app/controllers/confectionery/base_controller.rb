module Confectionery
  class BaseController < ApplicationController

    layout 'confectionery'
    # before_filter :authenticate_admin!

    protected

    def authenticate_admin!
      unless current_user && current_user.admin?
        render :status => :forbidden
      end
    end
  end
end
