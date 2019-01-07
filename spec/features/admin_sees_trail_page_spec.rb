require 'rails_helper'

describe 'as an admin' do
  it "visits the trail page and see a link to edit the trail" do
    admin = User.create(name: "penelope", password: "boom", role: 1)
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)
    trail_2 = Trail.create(name: "Little Trail", address: "South Carolina", length: 30)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/admin/trails/#{trail_1.id}"

    expect(page).to have_link("Edit Trail")
    expect(page).to have_link("Delete Trail")

    within "#trail-#{trail_1.id}"do
      click_on "Delete Trail"
    end

    expect(current_path).to eq(trails_path)
    expect(page).to_not have_content(trail_1.name)
    expect(page).to have_content(trail_2.name)

    within "#trail-#{trail_2.id}" do
      expect(page).to have_link("Edit Trail")
    end
  end
  it "sees a link to all watersources" do
    admin = User.create(name: "penelope", password: "boom", role: 1)
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)
    watersource_1 = trail_1.watersources.create(name: "Fountain Blue", mile: 2)
    watersource_2 = trail_1.watersources.create(name: "Fountain Red", mile: 21)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_trail_path(trail_1)

    click_link "View All Watersources"

    expect(current_path).to eq "/admin/trails/#{trail_1.id}/watersources"
    expect(page).to have_content("All Watersources")
    expect(page).to have_content(watersource_1.name)
    expect(page).to have_content(watersource_1.mile)
    expect(page).to have_content(watersource_2.name)
    expect(page).to have_content(watersource_2.mile)
  end
end
