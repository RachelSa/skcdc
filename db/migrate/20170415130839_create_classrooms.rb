class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :street_address
      t.string :town
      t.string :zipcode
      t.string :map_url
      t.string :image_url
      t.text :description
    end
  end
end
