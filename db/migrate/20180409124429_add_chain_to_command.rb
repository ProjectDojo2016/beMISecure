class AddChainToCommand < ActiveRecord::Migration[5.0]
  def change
    add_reference :commands, :chain, foreign_key: true
  end
end
