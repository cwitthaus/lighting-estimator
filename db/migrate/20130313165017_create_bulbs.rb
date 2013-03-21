class CreateBulbs < ActiveRecord::Migration
  def change
    create_table :bulbs do |t|
      t.string :lookup_code
      t.string :bulb_type
      t.float :wattage
      t.string :manufacturer
      t.boolean :energy_star
      t.float :cost
      t.float :lumens
      t.float :temperature
      t.string :model_number
      t.string :link

      t.timestamps
    end
  end
end
