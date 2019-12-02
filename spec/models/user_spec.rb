require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:example) do
    @user1 = create(:user)
  end

  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end

  it "has a unique username" do
    user2 = build(:user, email: "tom@gmail.com")
    expect(user2).to_not be_valid
  end

  it "has a unique email" do
    user2 = build(:user, username: "Tom")
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user2 = build(:random_user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid with a short password" do
    user2 = build(:random_user, password: "blah")
  end

  it "is not valid without a username" do
    user2 = build(:random_user, username: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without an email" do
    user2 = build(:random_user, email: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a password matching the password_confirmation" do
    user2 = build(:random_user, password: "blablabla", password_confirmation: "totallydifferent")
    expect(user2).to_not be_valid
  end
end
