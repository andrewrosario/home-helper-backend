class AddExpertStatusToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :expert_status, :string, :default => 'none'
  end
end
