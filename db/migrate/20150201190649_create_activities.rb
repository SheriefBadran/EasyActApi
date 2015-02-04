class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.boolean :indoors
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
