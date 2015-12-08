class CreateCountriesReleases < ActiveRecord::Migration
  def change
    create_table :countries_releases do |t|
      t.integer :country_id
      t.integer :release_id
      t.string :version
      t.boolean :is_enabled
    end
  end
end
