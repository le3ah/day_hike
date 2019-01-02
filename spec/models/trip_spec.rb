require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe  'relationships' do
    it {should have_many(:trip_trails)}
    it {should have_many(:trails).through(:trip_trails)}
  end

  describe  'instance methods' do
    it "#total_hiking_distance" do
      trip_1 = Trip.create(name: "Fall Hike", start_date: "September 1", end_date: "September 15")
      trail_1 = trip_1.trails.create(name: "Big Trail", address: "Alabama", length: 300)
      trail_2 = trip_1.trails.create(name: "Little Trail", address: "South Carolina", length: 600)
      trail_3 = trip_1.trails.create(name: "Medium Trail", address: "New Hampshire", length: 30)

      expect(trip_1.total_hiking_distance).to eq(930)
    end

    it "#average_hiking_distance" do
      trip_1 = Trip.create(name: "Fall Hike", start_date: "September 1", end_date: "September 15")
      trail_1 = trip_1.trails.create(name: "Big Trail", address: "Alabama", length: 300)
      trail_2 = trip_1.trails.create(name: "Little Trail", address: "South Carolina", length: 600)
      trail_3 = trip_1.trails.create(name: "Medium Trail", address: "New Hampshire", length: 30)
      expect(trip_1.total_hike_count).to eq(3)
      expect(trip_1.average_hiking_distance).to eq(310)
    end

    it "#longest_trail" do
      trip_1 = Trip.create(name: "Fall Hike", start_date: "September 1", end_date: "September 15")
      trail_1 = trip_1.trails.create(name: "Big Trail", address: "Alabama", length: 300)
      trail_2 = trip_1.trails.create(name: "Little Trail", address: "South Carolina", length: 600)
      trail_3 = trip_1.trails.create(name: "Medium Trail", address: "New Hampshire", length: 30)

      expect(trip_1.longest_trail.name).to eq(trail_2.name)
      expect(trip_1.longest_trail.length).to eq(trail_2.length)
    end
  end
end
