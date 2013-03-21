class CreateReplacementBulbs < ActiveRecord::Migration
  def change
    create_table :replacement_bulbs do |t|
      t.integer :bulb_id
      t.integer :replacement_id

      t.timestamps
    end
  end
end
