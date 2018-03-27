class AddChainToCommand < ActiveRecord::Migration[5.0]
  def change
    add_column :commands, :reference, :true
  end
end
