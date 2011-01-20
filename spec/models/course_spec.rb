require 'spec_helper'

describe Course do
 
 before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content", :body => "value for the body"}
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
      @user.courses.build(:bdoy => "a" * 1001).should_not be_valid
    end
  end
end
