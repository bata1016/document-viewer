FactoryBot.define do
  factory :folder do
    folder_name {'test'}
    association :user
  end
end
