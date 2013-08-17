require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin" do
    before { visit signin_path }

    it { should have_content('Sign in') }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_content('Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end
  end
=begin
  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      describe "in the Blogs controller" do
        before { post blogs_path }
        specify { expect(response).to redirect_to(signin_path) }
      end

      describe "submitting to the destroy action" do
        before { delete blog_path(FactoryGirl.create(:blog)) }
        specify { expect(response).to redirect_to(signin_path) }
      end
    end
  end
=end
end
