class CartsController < ApplicationController
    before_action :authenticate_user!

    def update
        parking_id = params[:cart][:parking_id]
        current_order.add_parking(parking_id)
        redirect_to root_path,  notice: "parking added seccessfuly"
    end
    
    def show
    @order = current_order
    end

end
