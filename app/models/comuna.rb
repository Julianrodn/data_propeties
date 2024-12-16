class Comuna < ApplicationRecord
  has_many :properties, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
