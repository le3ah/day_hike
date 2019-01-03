require 'rails_helper'

describe  'as a visitor' do
  it "should see the name and address of the trail" do
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)
    trail_2 = Trail.create(name: "Medium Trail", address: "New York", length: 600)
    trail_3 = Trail.create(name: "Little Trail", address: "South Carolina", length: 30)
    trip_1 = Trip.create(name: "Fall Hike", trails: [trail_1, trail_2], start_date: "September 1", end_date: "September 15")
    trip_2 = Trip.create(name: "Winter Hike", trails: [trail_1, trail_3], start_date: "March 1", end_date: "March 9")
    visit trail_path(trail_1)

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trail_1.address)
    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_1.total_hiking_distance)
    expect(page).to have_content(trip_2.name)
    expect(page).to have_content(trip_2.total_hiking_distance)

    visit trail_path(trail_2)
    expect(page).to have_content(trail_2.name)
    expect(page).to have_content(trail_2.address)
    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_1.total_hiking_distance)
    expect(page).to_not have_content(trip_2.name)
    expect(page).to_not have_content(trip_2.total_hiking_distance)
  end
  it "should see the total number of hiking trips including this trail" do
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)
    trail_2 = Trail.create(name: "Medium Trail", address: "New York", length: 600)
    trail_3 = Trail.create(name: "Little Trail", address: "South Carolina", length: 30)
    trip_1 = Trip.create(name: "Fall Hike", trails: [trail_1, trail_2], start_date: "September 1", end_date: "September 15")
    trip_2 = Trip.create(name: "Winter Hike", trails: [trail_1, trail_3], start_date: "March 1", end_date: "March 9")
    visit trail_path(trail_1)

    expect(page).to have_content(trail_1.total_trip_count)
  end
end
