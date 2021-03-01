require 'faker'
FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
  end

  factory :link do
    user_id {User.last.id}
    url {'https://google.com'}
    slug {''}
  end
end