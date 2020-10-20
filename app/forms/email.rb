class Email
  include ActiveModel::Model
  validates :send_email, presence: true
  validates :subject,    presence: true
  validates :message,    presence: true

  
  attr_accessor :send_email, :subject, :message, :user_id, :folder_id, :document_id
end