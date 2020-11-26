class Folder < ApplicationRecord

  validates  :user,        presence: true
  validates  :folder_name, presence: true
  # , uniqueness: {case_sensitive: true}, on: :create
  # validate :folder_name_is_unique
  belongs_to :user
  has_many   :documents, dependent: :destroy 

  def folder_name_is_unique
    unless Folder.where(folder_name: folder_name).count == 0
      errors.add(:folder_name, 'は既に存在します')
    end
  end
end
