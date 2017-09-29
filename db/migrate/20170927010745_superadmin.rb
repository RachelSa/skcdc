class Superadmin < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :super, :boolean, :default => false
  end
end
