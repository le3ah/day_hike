require 'rails_helper'

describe  'as a visitor' do
  it "should see registration form" do
    name = "Anthony"
    email = "Tony@gmail.com"
    visit root_path
    click_on 'Register'

    expect(current_path).to eq('/register')

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: "test"
    fill_in :user_password_confirmation, with: "test"

    click_on 'Create User'
    expect(current_path).to eq(trips_path)
    expect(page).to have_content("You have successfully registered")

  end
end
