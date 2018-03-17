class AddUserToPhoneRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :phone_requests, :user, foreign_key: true
  end
end
