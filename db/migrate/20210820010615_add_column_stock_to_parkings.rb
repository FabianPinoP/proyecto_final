class AddColumnStockToParkings < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :stock, :integer, default: 1
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
