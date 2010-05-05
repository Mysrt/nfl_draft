class CreatePicks < ActiveRecord::Migration
  def self.up
    create_table :picks do |t|
      t.integer :round
      t.integer :pick_number
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :picks
  end
end
