class CreateDealCategoryTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_deals, id: false do |t|
      t.references :deal, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
