class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :location
      t.string :map_url
      t.string :image_url
      t.belongs_to(:program, foreign_key: true)
      t.text :description
    end
  end
end
