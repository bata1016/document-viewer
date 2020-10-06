class Folder < ApplicationRecord

  # validates :folder_name, presence: true
  # validates :user,        presence: true
  validates :folder_name, uniqueness: {case_sensitive: true}, on: :create
  belongs_to :user
  has_many   :documents, dependent: :destroy 

  
end
