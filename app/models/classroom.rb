class Classroom < ApplicationRecord
  has_many :program_classrooms
  has_many :programs, through: :program_classrooms
  accepts_nested_attributes_for :programs

end
