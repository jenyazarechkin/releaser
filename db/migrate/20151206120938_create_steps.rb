class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :steps, :deleted_at
  end
end
