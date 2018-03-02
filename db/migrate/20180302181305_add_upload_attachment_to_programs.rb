class AddUploadAttachmentToPrograms < ActiveRecord::Migration[5.0]
  def change
    def change
      add_attachment :programs, :upload_attachment
    end
  end
end
