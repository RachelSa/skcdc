class AddAttachmentUploadAttachmentToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :upload_attachment
    end
  end

  def self.down
    remove_attachment :posts, :upload_attachment
  end
end
