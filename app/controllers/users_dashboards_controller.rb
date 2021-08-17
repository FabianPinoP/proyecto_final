class UsersDashboardsController < ApplicationController
  def index
    @user_parkings = Parking.where(user_id: current_user)
    # @user_orders = Order.find(order_id: current_order, user_id: current_user)
    # @user_orders = Order.where(:state => "created")
    # @user_orders = Order.where(params[:id])
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
