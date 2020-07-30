require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "they see product details on the product page" do
    #ACT
    visit root_path

    # click_link 'Details'
    # first.find_link("Details").click
    first('.product').find_link("Details").click

    #VERIFY
    # expect(page).to have_css 'article.product', count: 10
    expect(page).to have_css 'article.product-detail'
    
    #DEBUG
    save_screenshot('details-page.png')
  end

end
