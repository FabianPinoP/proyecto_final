class ParkingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.parking_mailer.parking_create.subject
  #
  def parking_create
    @greeting = "esto es una prueba"

    mail(to: "juanpablogast@gmail.com", subject: "esto es una prueba")  
  end
end