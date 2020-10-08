include ActionDispatch::TestProcess
FactoryBot.define do
  factory :document do
  document_tag    {'test'}
  # user            {FactoryBot.create(:user)}
  # folder          {FactoryBot.create(:folder)}
  association     :user
  association     :folder
  images          {fixture_file_upload('spec/images/test1.pdf')}

    # after(:build) do |document|
    #   pdf = Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test1.pdf"), 'application/pdf') 
    #   document.images << images: pdf
    # end
  end
end
