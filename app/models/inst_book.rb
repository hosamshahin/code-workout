  #~ Relationships ............................................................
  #~ Validation ...............................................................
  #~ Constants ................................................................
  #~ Hooks ....................................................................
  #~ Class methods ............................................................
  #~ Instance methods .........................................................
  #~ Private instance methods .................................................
class InstBook < ActiveRecord::Base

  #~ Relationships ............................................................
  belongs_to :course_offering
  belongs_to :inst_book_owner
  has_many :inst_book_section_exercises
  has_many :inst_chapters
  has_many :odsa_module_progresses
  has_many :odsa_user_interactions
  has_many :inst_sections_by_inst_book_section_exercises, :source => :inst_section, :through => :inst_book_section_exercises
  has_many :users_by_odsa_module_progress, :source => :user, :through => :odsa_module_progresses
  has_many :inst_book_section_exercises_by_odsa_user_interactions, :source => :inst_book_section_exercise, :through => :odsa_user_interactions
  has_many :inst_sections_by_odsa_user_interactions, :source => :inst_section, :through => :odsa_user_interactions
  has_many :users_by_odsa_user_interactions, :source => :user, :through => :odsa_user_interactions

  #~ Validation ...............................................................
  #~ Constants ................................................................
  #~ Hooks ....................................................................
  #~ Class methods ............................................................
  #~ Instance methods .........................................................
  #~ Private instance methods .................................................
end