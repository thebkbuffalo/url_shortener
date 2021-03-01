require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'can generate a random short url' do
    user = create(:user)
    link = build(:link)
    short_url = link.generate_short_url
    expect(short_url).to eq(link.slug)
  end
end