require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without race id" do
        registration = Registration.new(user_id: 1, boat_class_id: 1)

        expect(registration).to be_invalid
      end
      it "is invalid without user id" do
        registration = Registration.new(race_id: 1, boat_class_id: 1)

        expect(registration).to be_invalid
      end
      it "is invalid without boat class id" do
        registration = Registration.new(user_id: 1, race_id: 1)

        expect(registration).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all required attributes" do
        race = create(:race)
        user = create(:user)
        boat_class = create(:boat_class)

        registration = Registration.new(user_id: user.id, race_id: race.id, boat_class_id: boat_class.id)

        expect(registration).to be_valid
      end
    end
  end
end
