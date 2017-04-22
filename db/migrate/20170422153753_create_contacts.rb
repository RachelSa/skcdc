class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :phone
      t.string :ext
      t.string :email
      t.timestamps
    end
  end
end
