class Program < ApplicationRecord
  has_many :program_classrooms
  has_many :classrooms, through: :program_classrooms
  validates :title, :description, presence: true
  has_attached_file :upload_attachment
  validates_attachment_content_type :upload_attachment, :content_type => ['application/pdf']
end
