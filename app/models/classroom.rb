class Classroom < ApplicationRecord
  has_many :program_classrooms
  has_many :programs, through: :program_classrooms
  validates :name, presence: true

  def url_street_address
    "#{name.gsub(" ", "+")}+#{street_address.gsub(" ", "+")}+#{town.gsub(" ", "+")}+#{zipcode}"
  end

end
