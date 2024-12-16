class AddCurrencyToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :currency, :string
  end
end
