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

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(params[:service].permit(:name, :short))
      redirect_to service_path(@service)
    else
      redirect_to edit_service_path(@service),
        flash: "Konnte nicht geändert werden."
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:name, :short)
  end
end
