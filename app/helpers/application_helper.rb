module ApplicationHelper
  
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
  
  def signup
    image_tag("signup.png", :alt => "Sign Up")
  end
end