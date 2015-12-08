class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :countries, :deleted_at
  end
end
