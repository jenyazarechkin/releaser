class AddIndexesToCountriesRelease < ActiveRecord::Migration
  def change
    add_index :countries_releases, :country_id
    add_index :countries_releases, :release_id
  end
end
