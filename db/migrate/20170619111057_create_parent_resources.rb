class CreateParentResources < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_resources do |t|
      t.string :title
      t.string :outside_url
      t.text :description
    end
  end
end
