class UserMailer < ApplicationMailer
  default from: "blp0087bata@gmail.com"
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: @inquiry.mail,
      to: @inquiry.send_mail,
      subject: @inquiry.subject
    )
  end
end


