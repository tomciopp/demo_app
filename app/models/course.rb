class Course < ActiveRecord::Base
  attr_accessible :content, :body
  
  belongs_to :user
  
  validates :content, :presence => true, :length => { :maximum => 50 }
  validates :body,    :presence => true, :length => { :maximum => 1000}
  validates :user_id, :presence => true
  
  default_scope :order => 'courses.created_at DESC'
end
