class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.includes(:articles, :snippets).find(params[:id])
    @articles = @service.articles.order(created_at: :desc).limit(20)
    @snippets = @service.snippets.order(:name)
  end
end
