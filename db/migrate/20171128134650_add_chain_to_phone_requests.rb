class AddChainToPhoneRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :phone_requests, :chain, foreign_key: true
  end
end
