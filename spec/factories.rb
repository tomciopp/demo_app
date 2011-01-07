# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.first_name            "Thomas"
  user.last_name             "Cioppettini
  user.email                 "tciop@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end