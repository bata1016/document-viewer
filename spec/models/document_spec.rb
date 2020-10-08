require 'rails_helper'

RSpec.describe Document, type: :model do
  before do
    # user = FactoryBot.create(:user)
    folder = FactoryBot.create(:folder)
    @document = FactoryBot.build(:document, folder_id: folder.id)
    file_path = File.join(Rails.root, 'spec/images/test1.pdf')
    pdf = ActionDispatch::Http::UploadedFile.new(
      filename: File.basename(file_path),
      type: 'image/jpeg',
      tempfile: File.open(file_path)
    )
    @document.images = fixture_file_upload('spec/images/test1.pdf')
  end

  it "タグとPDFがあれば保存できること" do
    expect(@document).to be_valid
  end

  it "タグがないと保存できないこと" do
    @document.document_tag = nil
    @document.valid?
    expect(@document.errors.full_messages).to include('タグを入力してください')
  end
  it "PDFの添付がないと保存できないこと" do
    @document.images = nil
    @document.valid?
    expect(@document.errors.full_messages).to include('PDFを入力してください')
  end
  it "PDFでないと保存できないこと" do
    # @document.images = File.join(Rails.root, 'spec/images/t.png')
    @document.valid?
    binding.pry
    # expect(@document.errors.full_messages).to include('タグを入力してください')
  end
  # it "タグがないと保存できないこと" do
  #   @document.document_tag = nil
  #   @document.valid?
  #   expect(@document.errors.full_messages).to include('タグを入力してください')
  # end
end
