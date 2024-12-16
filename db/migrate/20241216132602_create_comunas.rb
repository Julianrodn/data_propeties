class CreateComunas < ActiveRecord::Migration[8.0]
  def change
    create_table :comunas do |t|
      t.string :name

      t.timestamps
    end
  end
end
