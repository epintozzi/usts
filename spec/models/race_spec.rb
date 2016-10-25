require 'rails_helper'

RSpec.describe Race, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without city" do
        race = Race.new(state: "IL")

        expect(race).to be_invalid
      end

      it "is invalid without state" do
        race = Race.new(city: "DePue")

        expect(race).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with city and state"do
        race = Race.new(city: "Depue", state: "IL")

        expect(race).to be_valid
      end

    end
  end
end
