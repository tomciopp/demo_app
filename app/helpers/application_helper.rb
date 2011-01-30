module ApplicationHelper
 include ReCaptcha::ViewHelper
  def title
    base_title = "Group Course"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("groupcourselogo.png", :alt => "Group Course", :class => "round")
  end
  
  def signbutton
    image_tag("Signup.png", :alt => "Sign Up", :class => "round")
  end
  
  def home
    image_tag("home.png", :alt => "Home")
  end
  
  def help
    image_tag("help.png", :alt => "Help")
  end

  def signin
    image_tag("signin.png", :alt => "Sign In")
  end
  
  def users
    image_tag("users.png", :alt => "Users")
  end
  
  def profile
    image_tag("profile.png", :alt => "Profile")
  end
  
  def leave
    image_tag("signout.png", :alt => "Sign Out")
  end
  
  def settings
    image_tag("settings.png", :alt => "Settings")
  end
  
  def about
    image_tag("about.png", :alt => "About")
  end
  
end
