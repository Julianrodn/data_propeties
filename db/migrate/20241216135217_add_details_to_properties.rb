class AddDetailsToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :area, :decimal
    add_column :properties, :bedrooms, :integer
    add_column :properties, :bathrooms, :integer
  end
end
