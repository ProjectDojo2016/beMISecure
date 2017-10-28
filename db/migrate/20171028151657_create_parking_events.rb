class CreateParkingEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_events do |t|
      t.datetime :parkrequest
      t.datetime :parkallowed
      t.string :parkcompleted
      t.string :datetime
      t.string :getbikecompleted
      t.string :datetime

      t.timestamps
    end
  end
end
