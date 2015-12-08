class RenameFieldOnStepsReleases < ActiveRecord::Migration
  def change
    rename_column :steps_releases, :country_id, :step_id
  end
end
