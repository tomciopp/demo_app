module UsersHelper
def gravatar_for(user, options = { :size => 75 })
    gravatar_image_tag(user.email.downcase, :alt => user.first_name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end
