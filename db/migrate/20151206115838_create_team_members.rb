class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.timestamps null: false
    end
    add_reference :team_members, :team, index: true
  end
end
