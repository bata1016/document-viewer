class Email
  include ActiveModel::Model
  
  attr_accessor :send_email, :subject, :message, :user_id, :folder_id, :document_id
end