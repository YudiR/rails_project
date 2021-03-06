class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.text :image
      t.string :category
      t.string :title
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
