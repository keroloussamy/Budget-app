require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.new(name: 'Kero', email: 'Kero@gmail.com', password: '123456')
    @entity = Entity.new(name: 'Ent 1', amount: 1, user: @user)
  end

  it 'name should be valid with correct parameters' do
    expect(@entity).to be_valid
  end

  it 'name should be present' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'icon should be present' do
    @entity.amount = 0
    expect(@entity).to_not be_valid
  end
end
