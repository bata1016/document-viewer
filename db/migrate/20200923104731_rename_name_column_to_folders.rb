class RenameNameColumnToFolders < ActiveRecord::Migration[6.0]
  def change
    rename_column :folders, :name, :folder_name
  end
end
