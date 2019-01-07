require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe 'relationships' do
    it {should have_many(:trip_trails)}
    it {should have_many(:trips).through(:trip_trails)}
    it { should have_many :watersources}
  end

  describe 'instance methods' do
    it "#total_trip_count" do
      trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)
      trail_2 = Trail.create(name: "Medium Trail", address: "New York", length: 600)
      trail_3 = Trail.create(name: "Little Trail", address: "South Carolina", length: 30)

      trip_1 = Trip.create(name: "Fall Hike", trails: [trail_1, trail_2], start_date: "September 1", end_date: "September 15")
      trip_2 = Trip.create(name: "Winter Hike", trails: [trail_1, trail_3], start_date: "March 1", end_date: "March 9")

      expect(trail_1.total_trip_count).to eq(2)
      expect(trail_2.total_trip_count).to eq(1)
      expect(trail_3.total_trip_count).to eq(1)
    end
  end
end
