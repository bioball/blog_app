require 'spec_helper'

describe "StaticPages" do

  subject { page }
  describe "home page" do
    before { visit root_path }
    describe "should have the proper title" do
      it { should have_content("Dan's Blog") }
    end
  end
end
