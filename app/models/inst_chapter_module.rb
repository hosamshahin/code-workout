class InstChapterModule < ActiveRecord::Base
  #~ Relationships ............................................................
  belongs_to :inst_chapter
  has_many :inst_sections

  #~ Validation ...............................................................
  #~ Constants ................................................................
  #~ Hooks ....................................................................
  #~ Class methods ............................................................
  #~ Instance methods .........................................................
  #~ Private instance methods .................................................
end