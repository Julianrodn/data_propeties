class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @properties = Property.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(3)
    @property = Property.new
    @comunas = Comuna.all
  end

  def show
    @property = Property.find(params[:id])

    response = HTTParty.get("https://mindicador.cl/api")
    if response.success?
      data = response.parsed_response
      exchange_rate = data["dolar"]["valor"].to_f

      @converted_price = if @property.currency == "CLP"
                           (@property.price / exchange_rate).round(2)
                         else
                           (@property.price * exchange_rate).round(2)
                         end
    else
      @converted_price = nil
    end
  end

  def new
    @property = current_user.properties.new
    @comunas = Comuna.all
  end

  def create
    @property = current_user.properties.new(property_params)
    if @property.save
      redirect_to @property, notice: 'Propiedad creada exitosamente.'
    else
      @comunas = Comuna.all
      render :new
    end
  end

  def edit
    @comunas = Comuna.all
  end

  def update
    if params[:property][:photos].present?
      @property.photos.attach(params[:property][:photos])
    else
      @property.photos = @property.photos

    end
    if @property.update(property_params)
      redirect_to @property, notice: 'Propiedad actualizada exitosamente.'
    else
      @comunas = Comuna.all
      render :edit
    end
  end

  def destroy
    if @property.destroy
      flash[:notice] = "La propiedad fue eliminada exitosamente."
    else
      flash[:alert] = "No se pudo eliminar la propiedad."
    end
    redirect_to properties_path
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: 'No autorizado.' unless @property.user == current_user
  end

  def property_params
    params.require(:property).permit(:property_type, :price, :currency, :comuna_id, :address, :area, :bedrooms, :bathrooms, :latitude, :longitude, :description, photos: [])
  end
end
