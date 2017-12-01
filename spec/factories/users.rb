FactoryBot.define do
  factory :user, :class => User do
    name        Faker::LordOfTheRings.unique.character
    email       Faker::Internet.unique.free_email
    password    Faker::Witcher.location + Faker::Number.number(3).to_s
  end
end
