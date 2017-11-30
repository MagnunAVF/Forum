FactoryBot.define do
  factory :user, :class => User do
    name     Faker::LordOfTheRings.unique.character
    email    Faker::Internet.unique.free_email
  end
end
