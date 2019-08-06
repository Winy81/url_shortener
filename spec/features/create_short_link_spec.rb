require "rails_helper"

RSpec.feature "Create short link" do
 

  scenario "with new link" do

    visit "/"

    fill_in "url_from_web", with: "https://guides.rubyonrails.org/"
    click_button "Submit"

    expect(page).to have_content("https://guides.rubyonrails.org/")
    expect(page).to have_content("http://localhost:3000/#{@short_url}")
    expect(page).to have_content("URL is added to list")

  end

  scenario "with exist link" do

    visit "/"

    fill_in "url_from_web", with: "https://guides.rubyonrails.org/"
    click_button "Submit"

    visit "/"

    fill_in "url_from_web", with: "https://guides.rubyonrails.org/"
    click_button "Submit"

    expect(page).to have_content("https://guides.rubyonrails.org/")
    expect(page).to have_content("http://localhost:3000/#{@short_url}")
    expect(page).to have_content("The link is exist already")

  end

end