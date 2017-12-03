FactoryBot.define do
  factory :admin, :class => Admin do
    name        Faker::TheFreshPrinceOfBelAir.unique.character
    email       Faker::Internet.unique.free_email
    password    Faker::StarWars.planet + Faker::Number.number(5).to_s
  end

  factory :common_user, :class => CommonUser do
    name        Faker::LordOfTheRings.unique.character
    email       Faker::Internet.unique.free_email
    password    Faker::Witcher.location + Faker::Number.number(3).to_s
  end
end
