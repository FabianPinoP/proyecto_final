class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :orders, foreign_key: true
      t.references :parkings, foreign_key: true

      t.timestamps
    end
  end
end
