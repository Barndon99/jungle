require 'rails_helper'

RSpec.feature "ProductShow", type: :feature, js: true do
  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "They see a products details" do
    # ACT
    visit root_path

    click_on "Details"
    sleep(5)
    # DEBUG / VERIFY

    save_screenshot
    expect(page).to have_css '.product-detail'
  end
end
