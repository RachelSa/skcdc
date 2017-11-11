class Carousel < ApplicationRecord
  has_attached_file :photo_1, styles: { small: "450x450" }
  validates_attachment :photo_1, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, attributes: :photo_1, less_than: 1.megabytes
  has_attached_file :photo_2, styles: { small: "450x450" }
  validates_attachment :photo_2, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, attributes: :photo_2, less_than: 1.megabytes
  has_attached_file :photo_3, styles: { small: "450x450" }
  validates_attachment :photo_3, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, attributes: :photo_3, less_than: 1.megabytes
  has_attached_file :photo_4, styles: { small: "450x450" }
  validates_attachment :photo_4, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, attributes: :photo_4, less_than: 1.megabytes
end
