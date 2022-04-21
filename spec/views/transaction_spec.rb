require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user1 = User.new(name: 'kero', email: 'kero@gmail.com', password: '123456')
    @user1.save
    @category = Group.new(name: 'Cat 1', icon: 'icon')
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    click_link 'New Category'
    fill_in 'Name', with: @category.name
    fill_in 'Icon URL', with: @category.icon
    click_button 'Next'
  end

  it 'should be able to see transactions' do
    click_on 'Cat 1'
    expect(page).to have_content('Transactions')
  end

  it 'should be able to redirect to add new transaction' do
    click_on 'Cat 1'
    click_link 'New Transaction'
    expect(page).to have_current_path(new_entity_path)
  end

  it 'should be able to save transaction' do
    click_on 'Cat 1'
    click_link 'New Transaction'
    fill_in 'Name', with: 'Trans 1'
    fill_in 'Amount', with: 5
    first('#entity_group_ids option', minimum: 1).select_option
    click_button 'Next'
    click_on 'Cat 1'
    expect(page).to have_content('Trans 1')
  end
end
