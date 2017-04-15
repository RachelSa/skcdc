class Program < ApplicationRecord
  has_many :program_classrooms
  has_many :classrooms, through: :program_classrooms
end
