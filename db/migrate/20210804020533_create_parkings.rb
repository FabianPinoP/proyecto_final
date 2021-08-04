class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :address
      t.text :description
      t.string :city
      t.decimal :price
      t.integer :size
      t.string :town
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
