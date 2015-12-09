class RemoveColumnFromStepsRelease < ActiveRecord::Migration
  def change
    remove_column :steps_releases, :status
  end
end
