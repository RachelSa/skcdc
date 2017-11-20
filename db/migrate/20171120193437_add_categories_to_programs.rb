class AddCategoriesToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :early_care_education, :boolean, default: false
    add_column :programs, :supporting_families_communities, :boolean, default: false
  end
end
