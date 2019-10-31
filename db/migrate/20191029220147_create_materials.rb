class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.integer :project_id
      t.string :name
      t.string :link
      t.float :cost
      t.float :amount
      t.string :amount_unit
      t.string :notes

      t.timestamps
    end
  end
end
