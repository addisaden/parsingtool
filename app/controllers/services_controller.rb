class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.includes(:articles, :snippets).find(params[:id])
  end
end
