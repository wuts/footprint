class CreateFootprints < ActiveRecord::Migration
  def self.up
    create_table :footprints do |t|
      t.string :name
      t.text :description
      t.decimal :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :footprints
  end
end
