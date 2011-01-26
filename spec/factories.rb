# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.first_name            "Thomas"
  user.last_name             "Cioppettini"
  user.email                 "tciop@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :course do |course|
  course.content "Foo bar"
  course.body "This will be the description of the course"
  course.location "27109"
  course.association :user
end