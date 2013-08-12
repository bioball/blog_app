require 'spec_helper'

describe User do
  before { @user = User.new(name: "Charles Barkley", email: "charles@barkley.com", 
                            password: "bobbert", password_confirmation: "bobbert") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }

  it { should be_valid }

  describe "remember token" do
    before { @user.save }
    its{:remember_token) { should_not be_blank }
  end
end
