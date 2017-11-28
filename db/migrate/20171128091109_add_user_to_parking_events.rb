class AddUserToParkingEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :parking_events, :user, foreign_key: true
  end
end
