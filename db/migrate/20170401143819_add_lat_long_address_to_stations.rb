class AddLatLongAddressToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :lat, :decimal
    add_column :stations, :long, :decimal
    add_column :stations, :address, :string
  end
end
