require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:first_name => "Example",
                 :last_name  => "User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      first_name = Faker::Name.name
      last_name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:first_name => name,
                   :last_name => example,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end