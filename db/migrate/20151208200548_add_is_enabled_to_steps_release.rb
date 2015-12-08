class AddIsEnabledToStepsRelease < ActiveRecord::Migration
  def change
    add_column :steps_releases, :is_enabled, :boolean
  end
end
