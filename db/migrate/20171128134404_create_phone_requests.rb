class CreatePhoneRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_requests do |t|

      t.timestamps
    end
  end
end
