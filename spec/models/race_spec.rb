require 'rails_helper'

RSpec.describe Race, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without city" do
        race = Race.new(state: "IL", start_date: '2017/07/25', end_date: '2017/07/27')

        expect(race).to be_invalid
      end

      it "is invalid without state" do
        race = Race.new(city: "DePue", start_date: '2017/07/25', end_date: '2017/07/27')

        expect(race).to be_invalid
      end

      it "is invalid without start date" do
        race = Race.new(city: "DePue", state: "IL", end_date: '2017/07/27')

        expect(race).to be_invalid
      end

      it "is invalid without end date" do
        race = Race.new(city: "DePue", state: "IL", start_date: '2017/07/27')

        expect(race).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with city and state"do
        race = Race.new(city: "Depue", state: "IL", start_date: '2017/07/25', end_date: '2017/07/27')

        expect(race).to be_valid
      end
    end
  end
  describe "relationships" do
    it "has many registrations" do
      race = create(:race)

      expect(race).to respond_to(:registrations)
    end
  end
end
