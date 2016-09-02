class SignupConfirmationJob < ActiveJob::Base
  queue_as :email

  def perform email
    # Do something later
    UserMailer.signup_confirmation(@user).deliver_now
  end
end
