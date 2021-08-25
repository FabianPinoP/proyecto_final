class HomeController < ApplicationController

    def index
        @q = Parking.ransack(params[:q])
        @parkings = @q.result(distinct: true).where("stock = 1").order("created_at DESC").page(params[:page]).per(10)
    end

end