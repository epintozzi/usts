require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without first name" do
        user = User.new(last_name: "Pintozzi", email: "erin@pintozzi.com", password: "helloworld")

        expect(user).to be_invalid
      end
      it "is invalid without last name" do
        user = User.new(first_name: "Erin", email: "erin@pintozzi.com", password: "helloworld")

        expect(user).to be_invalid
      end
      it "is invalid without email" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", password: "helloworld")

        expect(user).to be_invalid
      end
      it "is invalid without password" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", email: "erin@pintozzi.com")

        expect(user).to be_invalid
      end
      it "is invalid with short password" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", email: "erin@pintozzi.com", password: "hello")

        expect(user).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all required attributes" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", email: "erin@pintozzi.com", password: "helloworld")

        expect(user).to be_valid
      end
      it "is valid with all attributes" do
        user = User.new(first_name: "Erin", last_name: "Pintozzi", email: "erin@pintozzi.com", password: "helloworld", boat_number: "V26", usts_number: "12345")

        expect(user).to be_valid
      end
    end
  end
end
