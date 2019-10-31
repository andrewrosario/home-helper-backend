class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :resource_id
      t.integer :material_id
      t.integer :task_id
      t.string :text
      t.boolean :is_resolved

      t.timestamps
    end
  end
end
