class Course < ActiveRecord::Base
  attr_accessible :content, :body, :location, :start_date, :end_date
  
  belongs_to :user
  
  validates :content,    :presence => true, :length => { :maximum => 50 }
  validates :body,       :presence => true, :length => { :maximum => 1000}
  validates :user_id,    :presence => true
  validates :location,   :presence => true, :length => { :is => 5 }
  validates :start_date, :presence => true, :length => { :is => 10 }
  validates :end_date,   :presence => true, :length => { :is => 10 }
  
  default_scope :order => 'courses.created_at DESC'
  
  searchable do
    text :content, :default_boost => 2
    text :body,    :default_boost => 1.5
  end
end
