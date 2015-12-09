class CreateStatusesStepsReleases < ActiveRecord::Migration
  def change
    create_table :statuses_steps_releases do |t|
      t.integer :status
      t.timestamps null: false
    end
    add_reference :statuses_steps_releases, :steps_release, index: true
    add_reference :statuses_steps_releases, :country, index: true
  end
end
