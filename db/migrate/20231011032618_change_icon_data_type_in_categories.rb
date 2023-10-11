class ChangeIconDataTypeInCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :icon, :string
  end
end
