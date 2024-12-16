class Property < ApplicationRecord
  belongs_to :comuna
  belongs_to :user
  has_many_attached :photos

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :photos, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], on: :create
  validates :comuna, :address, :latitude, :longitude, presence: true
  validates :description, format: { without: /\b(\w+@\w+\.\w+|http\S+|[0-9]{8,})\b/, message: "no debe contener datos de contacto" }
  validates :property_type, inclusion: { in: ['Arriendo', 'Venta'], message: "debe ser 'Arriendo' o 'Venta'" }

  validates :area, numericality: { greater_than: 0, message: "debe ser mayor a 0" }, allow_nil: true
  validates :bedrooms, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :bathrooms, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
