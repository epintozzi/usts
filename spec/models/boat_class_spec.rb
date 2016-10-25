require 'rails_helper'

RSpec.describe BoatClass, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without class name" do
        boat_class = BoatClass.new

        expect(boat_class).to be_invalid
      end

      it "is invalid if class name is not unique" do
        boat_class_1 = BoatClass.create(class_name: "Kpro Hydro")
        boat_class_2 = BoatClass.create(class_name: "Kpro Hydro")

        expect(boat_class_1).to be_valid
        expect(boat_class_2).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with a class name" do
        boat_class = BoatClass.new(class_name: "Kpro Hydro")

        expect(boat_class).to be_valid
      end
    end
  end
  describe "relationships" do
    it "has many registrations" do
      boat_class = create(:boat_class)

      expect(boat_class).to respond_to(:registrations)
    end
  end
end
