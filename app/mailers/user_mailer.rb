class UserMailer < ApplicationMailer 
  def send_email(mail, user_mail, images)
    @mail = mail
    @user_mail = user_mail
    images.each do |image|
      attachments[image.filename.to_s] = { mime_type: 'application/pdf', content: image.blob.download }
    end
    binding.pry
    mail from: @user_mail, to: @mail.send_email, subject: @mail.subject, message: @mail.message
  end
end


