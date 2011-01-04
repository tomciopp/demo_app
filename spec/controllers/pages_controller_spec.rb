require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
	it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "Group Course | Home")
    end  
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
	it "should have the right title" do
      get 'contact'
      response.should have_selector("title", :content => "Group Course | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do 
	    get 'about'
		response.should be_success
	end
    
	it "should have the right title" do
      get 'about'
      response.should have_selector("title", :content => "Group Course | About")
    end
  end
end
