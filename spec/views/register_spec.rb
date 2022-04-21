require 'rails_helper'

RSpec.describe 'Register page', type: :feature do
  before :each do
    @user1 = User.new(name: 'kero', email: 'kero@gmail.com', password: '123456', password_confirmation: '123456')
    visit new_user_registration_path
  end

  it 'I can see the input in register page' do
    expect(page).to have_field 'Full name'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Confirm Password'
    expect(page).to have_button 'Next'
  end

  it 'should be able to see authenticated route' do
    fill_in 'Full name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Confirm Password', with: @user1.password_confirmation
    click_button 'Next'
    expect(page).to have_content('Categories')
  end

  it "shouldn't be able to enter to root route because the data is empty" do
    fill_in 'Full name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Confirm Password', with: ''
    click_button 'Next'
    expect(page).to have_content('3 errors')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
    expect(page).to have_content('Name can\'t be blank')
  end

  it "shouldn't be able to enter to root route because the pass don't match confirm" do
    fill_in 'Full name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Confirm Password', with: ''
    click_button 'Next'
    expect(page).to have_content('1 error')
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  it "shouldn't be able to enter to root route because email already taken" do
    @user1.save
    fill_in 'Full name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Confirm Password', with: @user1.password_confirmation
    click_button 'Next'
    expect(page).to have_content('1 error')
    expect(page).to have_content('Email has already been taken')
  end
end