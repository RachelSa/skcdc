class Carousel < ActiveRecord::Migration[5.0]
  def change
    create_table :carousels do |t|
      t.attachment :photo_1
      t.attachment :photo_2
      t.attachment :photo_3
      t.attachment :photo_4
    end
  end
end
