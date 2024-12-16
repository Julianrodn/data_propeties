class HomeController < ApplicationController
  def index
    @properties = Property.all

    allowed_params = params.permit(:max_price, :min_bedrooms, :min_bathrooms, :page)

    @properties = @properties.where('price <= ?', params[:max_price]) if params[:max_price].present?
    @properties = @properties.where('bedrooms >= ?', params[:min_bedrooms]) if params[:min_bedrooms].present?
    @properties = @properties.where('bathrooms >= ?', params[:min_bathrooms]) if params[:min_bathrooms].present?

    @properties = @properties.order(created_at: :desc).page(params[:page]).per(3)
  end
end
