class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.includes(:articles, :snippets).find(params[:id])
    @articles = @service.articles.order(created_at: :desc).limit(20)
    @snippets = @service.snippets.order(:name)
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if(@service.save)
      redirect_to service_path(@service)
    else
      redirect_to services_path, flash: @service.errors
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :short)
  end
end
