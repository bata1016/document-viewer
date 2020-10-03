class DocumentFolder

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :document_tag, :folder_name, :images, :user_id, :folder_id


  # バリデーション 
  validates :document_tag, presence: true
  validates :folder_name,   presence: true
  validates :images,         presence: true



  def save
    @folder = Folder.create(folder_name: folder_name, user_id: @user_id)
    Document.create(document_tag: document_tag, images: images, user_id: @user_id, folder_id: @folder.id)
  end

  private
  # 一意性制約定義
  # def folder_name_is_unique
  #   if Folder.where(folder_name: folder_name).exists?
  #     errors.add(:folder_name, "Folder name is already taken")
  #   end
  # end

end