require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Demo App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Demo App')
    end
  end  
end
