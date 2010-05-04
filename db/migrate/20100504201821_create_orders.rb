class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :round
      t.integer :pick
      t.references :team
      t.references :player

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
