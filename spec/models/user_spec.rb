require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @params = {email: "sample@example.com", password: "111111", password_confirmation: "111111"}
  end

  it "is valid full input" do
    user = User.new(@params)
    expect(user).to be_valid
  end

  it "is invalid without an email address" do
    user = User.new(@params.merge({email: ""}))
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # factory bot version
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, :valid, email: "")
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it { is_expected.to validate_presence_of(:email) }

  # インスタンスメソッドのテスト
  it "returns a user's name from email" do
    user = User.new(@params)
    expect(user.name).to eq "sample"
  end

  # スコープのテスト
  it "returns include string in email" do
    user1 = User.create(@params.merge({email: "sample1@example.com"}))
    user2 = User.create(@params.merge({email: "sample2@example.com"}))

    expect(User.search_email("sample1")).to include(user1)
    expect(User.search_email("sample1")).to_not include(user2)
  end
  
end
