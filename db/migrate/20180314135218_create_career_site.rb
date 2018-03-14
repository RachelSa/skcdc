class CreateCareerSite < ActiveRecord::Migration[5.0]
  def change
    create_table :career_sites do |t|
      t.string :name
      t.string :url
    end
  end
end
