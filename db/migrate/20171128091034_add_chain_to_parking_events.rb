class AddChainToParkingEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :parking_events, :chain, foreign_key: true
  end
end
