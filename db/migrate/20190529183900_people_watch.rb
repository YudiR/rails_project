class PeopleWatch < ActiveRecord::Migration[5.2]
  def change
    create_table  :people_watch do |t|
      t.integer :item_id
      t.integer :user_id
    end
  end
end