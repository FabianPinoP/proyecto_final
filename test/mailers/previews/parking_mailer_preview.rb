# Preview all emails at http://localhost:3000/rails/mailers/parking_mailer
class ParkingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/parking_mailer/parking_create
  def parking_create
    ParkingMailer.parking_create
  end

end
