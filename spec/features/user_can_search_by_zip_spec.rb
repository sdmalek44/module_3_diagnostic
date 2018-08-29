require 'rails_helper'

describe 'user visits /' do
  it 'can search by zip code' do
    visit '/'

    fill_in :q, with: '80203'

    click_on 'Locate'

    expect(current_path).to eq('/search')

    expect(page).to have_css(".station", count: 10)
    
    within(first(".station")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel-types")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access-times")
    end
  end
end
