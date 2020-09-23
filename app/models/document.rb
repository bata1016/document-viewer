class Document < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :folder
  has_one_attached :image
end
