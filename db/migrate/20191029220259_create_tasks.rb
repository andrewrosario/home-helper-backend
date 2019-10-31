class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :text
      t.integer :time_required
      t.integer :project_id
      t.boolean :in_progress

      t.timestamps
    end
  end
end
