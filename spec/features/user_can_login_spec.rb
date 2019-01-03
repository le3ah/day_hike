require 'rails_helper'

describe 'as a registered user' do
  it "should login user" do
    user = User.create(name: "Jim", email: "jim@gmail.com", password: "test")

    visit root_path
    click_on "login"

    expect(current_path).to eq(login_path)

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_on "submit"
    expect(current_path).to eq(profile_path)
  end
end
