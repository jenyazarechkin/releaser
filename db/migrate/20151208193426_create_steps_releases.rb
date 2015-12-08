class CreateStepsReleases < ActiveRecord::Migration
  def change
    create_table :steps_releases do |t|
      t.integer :status
      t.timestamps null: false
    end
    add_reference :steps_releases, :country, index: true
    add_reference :steps_releases, :release, index: true
  end
end
