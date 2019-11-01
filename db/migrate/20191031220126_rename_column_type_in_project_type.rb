class RenameColumnTypeInProjectType < ActiveRecord::Migration[6.0]
  def change
    rename_column :project_types, :type, :name
  end
end
