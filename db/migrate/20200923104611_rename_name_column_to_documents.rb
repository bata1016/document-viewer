class RenameNameColumnToDocuments < ActiveRecord::Migration[6.0]
  def change
    rename_column :documents, :name, :document_tag
  end
end
