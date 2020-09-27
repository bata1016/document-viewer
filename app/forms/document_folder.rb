class DocumentFolder

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :document_name, :folder_name, :images, :user_id, :folder_id

  # バリデーション 
  validates :document_name, presence: true
  validates :folder_name,   presence: true
  validates :images,         presence: true
  # validates :folder,        presence: true
  # validates :user,          presence: true

  def save
    @folder = Folder.create(folder_name: folder_name, user_id: @user_id)
    Document.create(document_name: document_name, images: images, user_id: @user_id, folder_id: @folder.id)
  end



end