class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.integer :stock,       null: false
      t.integer :price
      t.integer :category_id
      t.references :user,     null: false,foreign_key: true
      t.timestamps
    end
  end
end
