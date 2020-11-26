class RenameNameColumnToFolders < ActiveRecord::Migration[6.0]
  def change
    # rename_column :folders, :name, :folder_name
    add_index     :folders, [:user_id, :folder_name], unique: true
  end
end
