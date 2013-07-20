require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit new_user_registration_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end  

  describe "signup" do

    before { visit new_user_registration_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Sign up" }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobaris"
        fill_in "Confirmation", with: "foobaris"
      end

      it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1) 
      end

      describe "after saving the user" do
        before { click_button "Sign up" }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-notice', text: 'Welcome') }
      end  
    end
  end  
end  
