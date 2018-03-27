class AddResponseToPhoneRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :phone_requests, :response, :string
  end
end
