class CreateProgramClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :program_classrooms do |t|
      t.integer :program_id
      t.integer :classroom_id
      t.timestamps
    end
  end
end
