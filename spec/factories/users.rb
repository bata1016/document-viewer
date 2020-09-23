FactoryBot.define do
  factory :user do
    name                   {"abe"}
    email                  {"kkk@gmail.com"}
    password               {"000000aaaaa"}
    password_confirmation  {password}
  end
end
