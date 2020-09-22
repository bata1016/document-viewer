class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.references :folder, null: false, foreign_key: true
      t.references :user  , null: false, foreign_key: true
      t.timestamps
    end
  end
end
