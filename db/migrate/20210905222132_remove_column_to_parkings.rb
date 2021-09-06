class RemoveColumnToParkings < ActiveRecord::Migration[5.2]
  def change
    remove_column :parkings, :city
    remove_column :parkings, :town
  end
end
