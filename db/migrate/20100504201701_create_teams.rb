class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.string :division
      t.references :player
      t.references :pick

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
