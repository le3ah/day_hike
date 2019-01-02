require 'rails_helper'

describe  'as a visitor' do
  it "should see a list of all hiking trip names" do
    trip_1 = Trip.create(name: "Fall Hike", start_date: "September 1", end_date: "September 15")
    trip_2 = Trip.create(name: "Spring Hike", start_date: "March 1", end_date: "March 10")
    trip_3 = Trip.create(name: "Winter Hike", start_date: "December 1", end_date: "December 5")
    visit trips_path

    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_2.name)
    expect(page).to have_content(trip_3.name)

    click_link "#{trip_1.name}"

    expect(current_path).to eq(trip_path(trip_1))
  end

  it "should see a list of trails included in trip" do
    trip_1 = Trip.create(name: "Fall Hike", start_date: "September 1", end_date: "September 15")
    trail_1 = trip_1.trails.create(name: "Big Trail", address: "Alabama", length: 300)
    visit trip_path(trip_1)

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trail_1.address)
    expect(page).to have_content(trail_1.length)
  end

  it "should see the total & average hiking distances of all trails on trip" do
    trip_1 = Trip.create(name: "Fall Hike", start_date: "September 1", end_date: "September 15")
    trail_1 = trip_1.trails.create(name: "Big Trail", address: "Alabama", length: 300)
    trail_2 = trip_1.trails.create(name: "Little Trail", address: "South Carolina", length: 600)
    trail_3 = trip_1.trails.create(name: "Medium Trail", address: "New Hampshire", length: 30)

    visit trip_path(trip_1)

    expect(page).to have_content(trip_1.total_hiking_distance)
    expect(page).to have_content(trip_1.average_hiking_distance)
  end

  it "should see Longest Trail on Trip" do
    trip_1 = Trip.create(name: "Fall Hike", start_date: "September 1", end_date: "September 15")
    trail_1 = trip_1.trails.create(name: "Big Trail", address: "Alabama", length: 300)
    trail_2 = trip_1.trails.create(name: "Little Trail", address: "South Carolina", length: 600)
    trail_3 = trip_1.trails.create(name: "Medium Trail", address: "New Hampshire", length: 30)

    visit trip_path(trip_1)

    expect(page).to have_content("Longest Trail on Trip")

    expect(page).to have_content(trip_1.longest_trail.name)
    expect(page).to have_content(trip_1.longest_trail.length)
  end
end
