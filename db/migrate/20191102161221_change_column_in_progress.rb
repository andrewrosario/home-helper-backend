class ChangeColumnInProgress < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :in_progress, :is_complete
  end
end
