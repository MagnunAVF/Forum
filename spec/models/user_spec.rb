require 'rails_helper'

RSpec.describe User, type: :model do
  context "when created by types" do
    it "creates properly a common user" do
      user = FactoryBot.create :common_user
      expect(user.type).to eq("CommonUser")
    end

    it "creates properly an admin user" do
      user = FactoryBot.create :admin
      expect(user.type).to eq("Admin")
    end
  end

  context "when created" do
    it "is valid with valid attributes" do
      expect(FactoryBot.build :common_user).to be_valid
    end

    it "is NOT valid without a name" do
      expect(FactoryBot.build :common_user, name: nil).to be_invalid
    end

    it "is NOT valid without an email" do
      expect(FactoryBot.build :common_user, email: nil).to be_invalid
    end

    it "is NOT valid when name already exists" do
      name = Faker::LordOfTheRings.character
      FactoryBot.create :common_user, name: name, email: Faker::Internet.free_email

      another_user = FactoryBot.build :common_user, name: name, email: Faker::Internet.free_email

      expect(another_user).to be_invalid
    end

    it "is NOT valid when email already exists" do
      email = Faker::Internet.free_email
      FactoryBot.create :common_user, name: Faker::LordOfTheRings.character, email: email

      another_user = FactoryBot.build :common_user, name: Faker::LordOfTheRings.character, email: email

      expect(another_user).to be_invalid
    end

    it "is NOT valid with a wrong email" do
      expect(FactoryBot.build :common_user, email: 'foo.bart.com').to be_invalid
    end
  end
end
