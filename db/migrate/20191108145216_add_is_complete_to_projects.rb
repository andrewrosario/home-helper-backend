class AddIsCompleteToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :is_complete, :boolean, :default => false
  end
end
