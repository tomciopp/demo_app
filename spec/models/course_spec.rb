require 'spec_helper'

describe Course do
 
 before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content",
              :body => "value for the body",
              :location => "27109" }
  end

  it "should create a new instance given valid attributes" do
    @user.courses.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @course = @user.courses.create(@attr)
    end

    it "should have a user attribute" do
      @course.should respond_to(:user)
    end

    it "should have the right associated user" do
      @course.user_id.should == @user.id
      @course.user.should == @user
    end
  end
  
  describe "validations" do

    it "should require a user id" do
      Course.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.courses.build(:content => "  ").should_not be_valid
    end

    it "should reject long content" do
      @user.courses.build(:content => "a" * 51).should_not be_valid
    end
    
    it "should require nonblank body" do
      @user.courses.build(:body => "  ").should_not be_valid
    end

    it "should reject long bodies" do
      @user.courses.build(:body => "a" * 1001).should_not be_valid
    end
    
    it "should require nonblank location" do
      @user.courses.build(:location => " ").should_not be_valid
    end
    
    it "should reject long locations" do
      @users.courses.build(:location => "1" * 6).should_not be_valid
    end
    
    it "should reject short locations" do
      @users.courses.build(:location => "1" * 4).should_not be_valid
    end
  end
end
