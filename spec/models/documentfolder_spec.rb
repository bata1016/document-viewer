require 'rails_helper'

RSpec.describe DocumentFolder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @documentfolder = FactoryBot.build(:DocumentFolder, user_id: @user.id)
    @documentfolder.images = fixture_file_upload('spec/images/test1.pdf')
  end

  it "フォルダー名、タグ、PDFが存在すれば登録できること" do
    binding.pry
    expect(@documentfolder).to be_valid
  end
end
