class RenameUserIdToAuthorIdInDeals < ActiveRecord::Migration[7.0]
  def change
    rename_column :deals, :user_id, :author_id
  end
end
