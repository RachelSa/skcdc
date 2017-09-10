class RemoveUrlFromResources < ActiveRecord::Migration[5.0]
  def change
    remove_column :parent_resources, :outside_url, :string
  end
end
