require 'rails_helper'

RSpec.describe Folder, type: :model do
  before do
    user = FactoryBot.create(:user)
    @folder = FactoryBot.build(:folder, user_id: user.id)
  end

  it "フォルダー名とユーザーidがあれば登録できること" do
    expect(@folder).to be_valid
  end

  it "フォルダー名無しだと登録できないこと" do
    @folder.folder_name = nil
    @folder.valid?
    expect(@folder.errors.full_messages).to include("フォルダー名を入力してください")
  end

  it "フォルダー名が重複すると登録できないこと" do
    @folder.save
    another_folder = FactoryBot.build(:folder)
    another_folder.valid?
    expect(another_folder.errors.full_messages).to include("フォルダー名はすでに存在します")
  end
end
