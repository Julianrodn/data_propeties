class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.references :comuna, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :price
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.text :description
      t.string :property_type

      t.timestamps
    end
  end
end
