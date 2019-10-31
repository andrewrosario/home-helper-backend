class CreateExpertIns < ActiveRecord::Migration[6.0]
  def change
    create_table :expert_ins do |t|
      t.integer :user_id
      t.integer :project_type_id
      t.integer :rate

      t.timestamps
    end
  end
end
