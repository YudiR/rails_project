class ChangePriceCentsToBeFloatInItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :price_cents, :float
  end
end
