class Addphonetoclassroom < ActiveRecord::Migration[5.0]
  def change
    add_column :classrooms, :phone, :string
  end
end
