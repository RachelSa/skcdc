class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_attached_file :upload_attachment
  validates_attachment_content_type :upload_attachment, :content_type => ['application/pdf']

end
