class Document < ApplicationRecord
  validates :document_name, presence: true
  # validates :user,          presence: true
  # validates :folder,        presence: true

  belongs_to :user
  belongs_to :folder
  has_many_attached :images
end
