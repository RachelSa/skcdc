class Classroom < ApplicationRecord
  has_many :program_classrooms
  has_many :programs, through: :program_classrooms
  validates :name, presence: true
  has_attached_file :image, styles: { small: "450x450" }
  validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

  def url_street_address
    "#{name.gsub(" ", "+")}+#{street_address.gsub(" ", "+")}+#{town.gsub(" ", "+")}+#{zipcode}"
  end

end
