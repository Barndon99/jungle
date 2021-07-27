require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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
    
    scenario "They add an item to the cart" do
      # ACT
      visit root_path
      expect(page).to have_content 'My Cart (0)'
      click_on "Add"
      sleep(5)
      # DEBUG / VERIFY
      save_screenshot
      expect(page).to have_content 'My Cart (1)'
    end
end
