class CreateReplacements < ActiveRecord::Migration
  def change
    create_table :replacements do |t|
      t.integer :quantity
      t.string :current_bulb_name
      t.float :current_bulb_wattage
      t.integer :replacement_bulb_id
      t.float :percent_reduction
      t.integer :estimate_id

      t.timestamps
    end
  end
end
