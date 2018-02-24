class CreateParkingEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_events do |t|
      t.datetime :parkrequest
      t.datetime :parkallowed
      t.datetime :parkcompleted
      t.datetime :getbikerequest
      t.datetime :getbikecomplited

      t.timestamps
    end
  end
end
