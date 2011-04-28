module Confectionery
  class UsersController < BaseController

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new(params[:user])
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        redirect_to @user
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to @user
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end

  end
end
