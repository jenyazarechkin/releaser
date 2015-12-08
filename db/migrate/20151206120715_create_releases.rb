class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.datetime :released_at
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_reference :releases, :team, index: true
    add_index :releases, :deleted_at
  end
end
