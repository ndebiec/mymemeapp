require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has an email' do
    user = User.create!(email: 'testemail@op.pl', password: 'Qwerty123')
    expect(user.email).to eq('testemail@op.pl')
end
end