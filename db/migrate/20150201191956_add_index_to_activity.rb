class AddIndexToActivity < ActiveRecord::Migration
  def change
    add_index :activities, :category_id
  end
end
