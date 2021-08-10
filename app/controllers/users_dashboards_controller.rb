class UsersDashboardsController < ApplicationController
  def index
    @user_parkings = Parking.where(user_id: current_user.id)


  end

  def edit
  end

  def update
  end
end
