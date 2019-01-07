require 'rails_helper'

describe 'as a default user' do
  it "visits the trail page and does not see a link to edit the trail" do
    admin = User.create(name: "penelope", password: "boom", role: 0)
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/admin/trails/#{trail_1.id}"

    expect(page).to_not have_link("Edit Trail")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  it "visits the watersource page and does not see a link to edit the trail" do
    admin = User.create(name: "penelope", password: "boom", role: 0)
    trail_1 = Trail.create(name: "Big Trail", address: "Alabama", length: 300)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/admin/trails/#{trail_1.id}/watersources"

    expect(page).to_not have_content("View All Watersources")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
