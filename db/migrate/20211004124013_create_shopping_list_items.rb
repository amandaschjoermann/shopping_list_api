class CreateShoppingListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_list_items do |t|
      t.string :name
      t.boolean :done, default: false
      t.references :shopping_list, foreign_key: true
      t.timestamps
    end
  end
end
