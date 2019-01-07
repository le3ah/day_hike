require 'rails_helper'

describe  'as a visitor' do
  it "should see a list of all watersources" do
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)
    watersource_1 = trail_1.watersources.create(name: "Fountain Blue", mile: 2)
    watersource_2 = trail_1.watersources.create(name: "Fountain Red", mile: 12)
    watersource_3 = trail_1.watersources.create(name: "Fountain Green", mile: 21)

    visit trail_path(trail_1)

    click_on "View Watersources"

    expect(current_path).to eq(trail_watersources_path(trail_1))
    expect(page).to have_content(watersource_1.name)
    expect(page).to have_content(watersource_1.mile)
    expect(page).to have_content(watersource_2.name)
    expect(page).to have_content(watersource_2.mile)
    expect(page).to have_content(watersource_3.name)
    expect(page).to have_content(watersource_3.mile)
  end

  it "should see a link to each watersource show page" do
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)
    watersource_1 = trail_1.watersources.create(name: "Fountain Blue", mile: 2)

    visit trail_watersources_path(trail_1)

    click_link "#{watersource_1.name}"

    expect(current_path).to eq ("/trails/#{trail_1.id}/watersources/#{watersource_1.id}")
  end
end
