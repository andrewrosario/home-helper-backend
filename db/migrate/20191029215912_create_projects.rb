class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :project_type_id
      t.string :description
      t.integer :expert_id
      t.integer :novice_id

      t.timestamps
    end
  end
end
