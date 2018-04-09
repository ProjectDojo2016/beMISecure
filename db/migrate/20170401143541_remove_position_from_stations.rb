class RemovePositionFromStations < ActiveRecord::Migration[5.0]
  def change
    remove_column :stations, :Position, :string
  end
end
