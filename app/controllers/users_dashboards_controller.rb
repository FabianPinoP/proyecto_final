class UsersDashboardsController < ApplicationController
  def index
    @user_parkings = Parking.where(user_id: current_user)
    @user_orders = current_user.orders.where(:state => "completed")
    @order = current_order
  end

  def delete_item_dashboard
    order_item_id = params[:id] 
    order_cart =  OrderItem.where(id: order_item_id, order_id: current_order.id ).first
    order_cart.destroy
    current_order.price_total
    redirect_to users_dashboards_index_path
end

  def show
  end
  def edit
  end

  def update
  end
end
