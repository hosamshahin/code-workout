class LatePolicy < ActiveRecord::Base

  #~ Relationships ............................................................
  has_many :course_offerings,
    inverse_of: :late_policy,
    dependent: :destroy

  #~ Validation ...............................................................

  validates :name, presence: true,
    uniqueness: { case_sensitive: true }

  #~ Private instance methods .................................................
end