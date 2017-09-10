class AddAttachmentImageToClassrooms < ActiveRecord::Migration
  def change
    add_attachment :classrooms, :image
  end
end
