require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            firstname: 'Mike',
                            lastname: 'M',
                            email: 'mike@gmail.com'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/firstname/)
    expect(rendered).to match(/lastname/)
    expect(rendered).to match(/email/)
  end
end
