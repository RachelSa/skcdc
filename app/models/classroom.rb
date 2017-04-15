class Classroom < ApplicationRecord
  has_many :program_classrooms
  has_many :programs, through: :program_classrooms
end
