class Document < ApplicationRecord
  validates :document_tag,    presence: true
  validates :images,          presence: true
  validates :user,            presence: true
  validates :folder,          presence: true
  validate :images_length_validate, :images_type_validate

  belongs_to :user
  belongs_to :folder
  has_many_attached :images


  private
  def images_length_validate
    if images != nil
      if images.length >= 5
      errors.add(:images, "は4枚までにしてください")
      end
    end
  end

  def images_type_validate
    if images != nil
      binding.pry
      images.each do |image|
        if !image.content_type.include?('pdf')
          errors.add(:images,'で保存してください')
        end
      end
    end
  end

end
