require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}

  it {should be_valid}

  describe "when name is not present" do
    before {@user = User.new(name: ' ', email: "user@example.com")}
    
    it {should_not be_valid}
  end

  describe "when email is not present" do
    before do
      @user = User.new(name:'Mickey Mouse', email:' ')
    end

    it {should_not be_valid}
  end

  describe "when name is too long (over 50 chars)" do
    before {@user.name='a'*51}
    it {should_not be_valid}
  end

  describe "when email format is invalid" do
    it 'should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |email|
        @user.email = email
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it 'should be valid' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |email|
        @user.email = email
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it {should_not be_valid}
  end

  describe "when password is empty" do
    before do
      @user = User.new(name: 'Example User', email: 'user@example.com', password: ' ', password_confirmation: ' ')
    end

    it {should_not be_valid}
  end

  describe "when password and confirmation does not match" do
    before {@user.password_confirmation='mismatch'}
    it{should_not be_valid}
  end
end