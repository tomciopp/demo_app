require 'spec_helper'

describe "Courses" do

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do

    describe "failure" do

      it "should not make a new course" do
        lambda do
          visit root_path
          fill_in :course_content, :with => ""
          fill_in :course_body, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Course, :count)
      end
    end

    describe "success" do

      it "should make a new course" do
        content = "Lorem ipsum dolor sit amet"
        body = "Continued latin phrases"
        lambda do
          visit root_path
          fill_in :course_content, :with => content
          fill_in :course_body, :with => body
          click_button
          response.should have_selector("span.content", :content => content)
          response.should have_selector("span.body", :body => body)
        end.should change(Course, :count).by(1)
      end
    end
  end
end