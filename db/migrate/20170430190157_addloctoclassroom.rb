class Addloctoclassroom < ActiveRecord::Migration[5.0]
  def change
    add_column :classrooms, :latitude, :string
    add_column :classrooms, :longitude, :string
    add_column :classrooms, :google_address, :string

  end
end
