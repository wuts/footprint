class CreateMyfootprints < ActiveRecord::Migration
  def self.up
    create_table :myfootprints do |t|
      t.integer :user_id
      t.integer :footprint_id
      t.integer :progress_id
      t.datetime :occur_time
      t.string :photo

      t.timestamps
    end
  end

  def self.down
    drop_table :myfootprints
  end
end
