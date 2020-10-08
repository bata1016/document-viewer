require 'rails_helper'

RSpec.describe DocumentFolder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @documentfolder = FactoryBot.build(:DocumentFolder, user_id: @user.id)
    file_path = File.join(Rails.root, 'spec/images/test1.pdf')
    pdf = ActionDispatch::Http::UploadedFile.new(
      filename: File.basename(file_path),
      type: 'image/jpeg',
      tempfile: File.open(file_path)
    )
    
    @documentfolder.images = fixture_file_upload(pdf)
  end

  it "フォルダー名、タグ、PDFが存在すれば登録できること" do
    binding.pry
    expect(@documentfolder).to be_valid
  end
end
