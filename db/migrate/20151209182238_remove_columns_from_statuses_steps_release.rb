class RemoveColumnsFromStatusesStepsRelease < ActiveRecord::Migration
  def change
    remove_column :statuses_steps_releases, :updated_at, :datetime
    remove_column :statuses_steps_releases, :created_at, :datetime
  end
end
