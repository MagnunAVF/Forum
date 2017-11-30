require 'rails_helper'

RSpec.describe User, type: :model do
  context "when created" do
    it "is valid with valid attributes" do
      expect(FactoryBot.build :user).to be_valid
    end

    it "is NOT valid without a name" do
      expect(FactoryBot.build :user, name: nil).to be_invalid
    end

    it "is NOT valid without an email" do
      expect(FactoryBot.build :user, email: nil).to be_invalid
    end

    it "is NOT valid when name already exists" do
      name = Faker::LordOfTheRings.character
      FactoryBot.create :user, name: name, email: Faker::Internet.free_email

      user2 = FactoryBot.build :user, name: name, email: Faker::Internet.free_email

      expect(user2).to be_invalid
    end

    it "is NOT valid when email already exists" do
      email = Faker::Internet.free_email
      FactoryBot.create :user, name: Faker::LordOfTheRings.character, email: email

      user2 = FactoryBot.build :user, name: Faker::LordOfTheRings.character, email: email

      expect(user2).to be_invalid
    end

    it "is NOT valid with a wrong email" do
      expect(FactoryBot.build :user, email: 'foo.bart.com').to be_invalid
    end
  end
end
