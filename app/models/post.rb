class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  has_attached_file :upload_attachment
  do_not_validate_attachment_file_type :upload_attachment

end
