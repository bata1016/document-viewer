class Document < ApplicationRecord
  validates :document_name, presence: true
  # validates :user,          presence: true
  # validates :folder,        presence: true

  belongs_to :user
  belongs_to :folder
  has_many_attached :images


  # def self.search(search)
  #   if search != ""
  #     # binding.pry
  #     Document.where("document_name LIKE(?)", "%#{search}%")
  #   end
  # end

end
