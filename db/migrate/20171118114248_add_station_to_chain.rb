class AddStationToChain < ActiveRecord::Migration[5.0]
  def change
    add_reference :chains, :station, foreign_key: true
  end
end
