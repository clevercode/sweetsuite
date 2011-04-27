module Confectionery
  class ApplicationsController < BaseController

    def index
      @applications = Application.all
    end

    def show
      @application = Application.find(params[:id])
    end

    def new
      @application = Application.new(params[:application])
    end

    def create
      @application = Application.new(params[:application])
      @application.make_inferences
      if @application.save
        redirect_to @application
      else
        render :new
      end
    end

    def edit
      @application = Application.find(params[:id])
    end

    def update
      @application = Application.find(params[:id])
      if @application.update_attributes(params[:application])
        redirect_to @application
      else
        render :edit
      end
    end

    def destroy
      @application = Application.find(params[:id])
      @application.destroy
    end

  end
end
