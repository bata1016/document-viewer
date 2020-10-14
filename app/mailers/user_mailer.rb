class UserMailer < ApplicationMailer
  default from: "blp0087bata@gmail.com"
  def mailform(post_data_mail=nil)
  @mail_data = post_data_mail

    # テストする際には、@mail_data['email']を「送信元の固定メアド」、@mail_data['subject']を「テスト」とでも。
    # mail :to => 'MAILUSER@example.jp', :from => @mail_data['email'], :subject => @mail_data['subject']
end
