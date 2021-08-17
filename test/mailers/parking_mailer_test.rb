require 'test_helper'

class ParkingMailerTest < ActionMailer::TestCase
  test "parking_create" do
    mail = ParkingMailer.parking_create
    assert_equal "Parking create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
