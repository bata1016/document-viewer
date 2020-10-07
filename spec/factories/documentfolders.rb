FactoryBot.define do
  factory :DocumentFolder do
    folder_name                   {"abe"}
    document_tag                  {"cde"}
    # images                        {fixture_file_upload(Rails.root.join('spec/images/test1.pdf'), 'pdf')}
    # images                        {['xxx.pdf']}
    # user                           {FactoryBot.create(:user)}
    association                    :user




    # after(:build) do |item|
    #   binding.pry
    #   item.images.attach(io: File.open('spec/images/test1.pdf'), filename: 'test1.pdf')
    # end
  end


  # factory :images do 
  #   image {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test1.pdf'), 'pdf')}
  # end
end
