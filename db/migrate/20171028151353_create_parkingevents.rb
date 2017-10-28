class CreateParkingevents < ActiveRecord::Migration[5.0]
  def change
    create_table :parkingevents do |t|
      t.string :parkrequest
      t.string :datetime
      t.string :parkallowed
      t.string :d

      t.timestamps
    end
  end
end
