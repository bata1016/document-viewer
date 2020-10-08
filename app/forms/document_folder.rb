class DocumentFolder

  include ActiveModel::Model
  include ActiveModel::Validations


  attr_accessor :document_tag, :folder_name, :images, :user_id, :folder_id


  # バリデーション 
  validates :document_tag, presence: true
  validates :folder_name,   presence: true
  validates :images,         presence: true
  validate :folder_name_is_unique, :images_length_validate, :images_type_validate
  #  :check_file_type
  # :images_type_validate
  # attached: true, content_type: {in:'application/pdf', message: 'で保存してください'}



  def save
    @folder = Folder.create(folder_name: folder_name, user_id: @user_id)
    Document.create(document_tag: document_tag, images: images, user_id: @user_id, folder_id: @folder.id)
  end

  # 独自のバリデーション

  private
  def images_length_validate
    if images != nil
      if images.length >= 5
      errors.add(:images, "は4枚までにしてください")
      end
    end
  end

  # def check_file_type
  #   if images != nil
  #     images.each do |image|
  #       !image.content_type.in?(%w(application/pdf))
  #       errors.add(:images, "で保存してください")
  #     end
  #   end
  # end

  def images_type_validate
    if images != nil
      images.each do |image|
        binding.pry
         file_name = File.extname(image)
        if !file_name.include?(".pdf")
          !image.content_type.include?('application/pdf')
          errors.add(:images,'で保存してください')
        end
      end
    end
  end

  def folder_name_is_unique
    unless Folder.where(folder_name: folder_name).count == 0
      errors.add(:folder_name, 'は既に存在しています')
    end
  end

end