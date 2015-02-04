class DropCategoriesTable < ActiveRecord::Migration
  def up
    drop_table :categories
  end
end
