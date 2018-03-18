class CreateEmployeeResources < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_resources do |t|
      t.string :name
      t.string :url
    end
  end
end
