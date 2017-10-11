class AddAddressToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :address, :string
  end
end
