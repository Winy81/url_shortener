require "rails_helper"

RSpec.feature "Redirect short link" do

  before do 
    @short_url = ShortenedUrl.create!(original_url:"https://guides.rubyonrails.org/", short_url: "e34csj6n28" )
    @basic_url = @short_url.original_url
  end

  scenario "with valid link" do 

    visit "http://localhost:3000/#{@short_url.short_url}"

    expect(URI.parse(current_url).to_s).to eq(@basic_url)

  end

end