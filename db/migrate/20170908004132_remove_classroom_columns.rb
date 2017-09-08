class RemoveClassroomColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :classrooms, :map_url, :string
    remove_column :classrooms, :google_address, :string
  end
end
