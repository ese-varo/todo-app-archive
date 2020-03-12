require 'rails_helper'
RSpec.feature 'Create Lists' do
  before do
    @user = User.create!(name: 'user1', email: 'user@example.com', password: 'password')
    visit '/users/sign_in'
    print page.html
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end
  scenario 'A user create a list' do
    print page.html
    click_link 'New list'
    fill_in 'list[title]', with: 'lists nueva'
    click_button 'Save'
    expect(page).to have_content('lists nueva')
    expect(page.current_path).to eq(lists_path)
  end
  scenario 'A user fails create a list' do
    click_link 'New list'
    fill_in 'list[title]', with: ''
    click_button 'Save'
    expect(page).to have_content("Title can't be blank")
    expect(current_path).to eq(lists_path)
  end
end
