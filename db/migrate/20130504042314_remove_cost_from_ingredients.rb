class RemoveCostFromIngredients < ActiveRecord::Migration
  def up
    remove_column :ingredients, :cost
  end

  def down
    add_column :ingredients, :cost, :float
  end
end
