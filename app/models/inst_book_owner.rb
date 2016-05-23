class InstBookOwner < ActiveRecord::Base
  #~ Relationships ............................................................
  belongs_to :book_role
  belongs_to :user
  has_many :inst_books
  has_many :course_offerings, :through => :inst_books

  #~ Validation ...............................................................
  #~ Constants ................................................................
  #~ Hooks ....................................................................
  #~ Class methods ............................................................
  #~ Instance methods .........................................................
  #~ Private instance methods .................................................


end
