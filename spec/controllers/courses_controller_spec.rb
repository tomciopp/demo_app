require 'spec_helper'

describe CoursesController do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  
  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :content => "", :body => "", :location => "" }
      end

      it "should not create a course" do
        lambda do
          post :create, :course => @attr
        end.should_not change(Course, :count)
      end

      it "should render the home page" do
        post :create, :course => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :content => "Lorem ipsum", :body => "Dolor sit amet", :location => "27109" }
      end

      it "should create a course" do
        lambda do
          post :create, :course => @attr
        end.should change(Course, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :course => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :course => @attr
        flash[:success].should =~ /course created/i
      end
    end
  end
  
  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @course = Factory(:course, :user => @user)
      end

      it "should deny access" do
        delete :destroy, :id => @course
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @course = Factory(:course, :user => @user)
      end

      it "should destroy the course" do
        lambda do 
          delete :destroy, :id => @course
        end.should change(Course, :count).by(-1)
      end
    end
  end
end