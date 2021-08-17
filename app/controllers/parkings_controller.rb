class ParkingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parking, only: %i[ show edit update destroy like]

  # GET /parkings or /parkings.json
  def index
    @parkings = Parking.all


    @parkings = Parking.search(params[:searchbox])
      respond_to do |format|
        format.html 
      end
  end

  def like
    @parking = Parking.find(params[:id])
    if current_user.voted_up_on? @parking
      @parking.downvote_by current_user
    elsif current_user.voted_down_on? @parking
      @parking.upvote_by current_user
    else #not voted
      @parking.upvote_by current_user
    end
    respond_to do |format|
     format.js
    end 
  end



  # GET /parkings/1 or /parkings/1.json
  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new
  end

  # GET /parkings/1/edit
  def edit
    @parking = Parking.find(params[:id])
  end

  # POST /parkings or /parkings.json
  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id

    respond_to do |format|
      if @parking.save
        ParkingMailer.parking_create.deliver_later
        format.html { redirect_to @parking, notice: "Parking was successfully created." }
        format.json { render :show, status: :created, location: @parking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parkings/1 or /parkings/1.json
  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to @parking, notice: "Parking was successfully updated." }
        format.json { render :show, status: :ok, location: @parking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkings/1 or /parkings/1.json
  def destroy
    @parking.destroy
    respond_to do |format|
      format.html { redirect_to parkings_url, notice: "Parking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_params
      params.require(:parking).permit(:address, :description, :city, :price, :size, :town, :size_parking, :image, :user_id)
    end
end
