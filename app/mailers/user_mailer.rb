class UserMailer < ApplicationMailer 
  default from: "blp0087bata@gmail.com"
  layout "mailer"
  
  def send_email(email_params, user_mail, images)
    @email_params = email_params
    @user_mail = user_mail
    images.each do |image|
      attachments[image.filename.to_s] = { mime_type: 'application/pdf', content: image.blob.download }
    end
    mail(
      from: @user_mail,
      to: @email_params[:send_email],
      subject: @email_params[:subject],
      message: @email_params[:message]
    )
  end
end


