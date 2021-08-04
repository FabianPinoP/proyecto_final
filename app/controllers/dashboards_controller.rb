class DashboardsController < ApplicationController

    def index
        @users = User.all

    end


    private

    def dash_params
        params.require(:user).permit(:name, :number, :email, :admin)
    end
end
