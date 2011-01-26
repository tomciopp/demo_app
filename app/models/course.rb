class Course < ActiveRecord::Base
  attr_accessible :content, :body, :location
  
  belongs_to :user
  
  validates :content,  :presence => true, :length => { :maximum => 50 }
  validates :body,     :presence => true, :length => { :maximum => 1000}
  validates :user_id,  :presence => true
  validates :location, :presence => true, :length => { :is => 5 }
  
  default_scope :order => 'courses.created_at DESC'
end
