require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(email: 'email@dot.com')).to be_valid
  end

  it 'is invalid with no attributes' do
    expect(User.new).to_not be_valid
  end

end
