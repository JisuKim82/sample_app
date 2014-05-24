require 'spec_helper'

describe "User pages" do
  describe 'signup page' do
      before {visit signup_path}
      it 'should have the content "Sign up"' do
        expect(page).to have_content('Sign up')
      end

      it 'should have the title "Sign Up"' do
        expect(page).to have_title("Sample App | Sign up")
      end
  end
end