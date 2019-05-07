class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :price, :price_cents
  end
end
