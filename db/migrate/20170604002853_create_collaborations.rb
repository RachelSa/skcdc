class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.string :title
      t.text :description
    end
  end
end
