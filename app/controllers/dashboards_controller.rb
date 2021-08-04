class DashboardsController < ApplicationController

    def index
        @users = User.all
    end

    def parking
      @parkings = Parking.all
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to dashboard_path
    end

    def update_status
        user = User.find(params[:id])
        if user.admin?
          user.admin = 0
        else
          user.admin = 1
        end
        user.save
        flash[:success] = "status User is updated"
        redirect_to dashboard_path
    end


end
