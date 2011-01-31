class UserMailer < ActionMailer::Base
  default :from => "no-reply@groupcourse.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://groupcourse.heroku.com/signin"
    mail(:to => user.email,
         :subject => "Welcome to Group Course")
  end
end
