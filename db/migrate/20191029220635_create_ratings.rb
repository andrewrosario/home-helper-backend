class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :novice_id
      t.integer :expert_id
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
