class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.text :path
      t.integer :documentable_id
      t.string :documentable_type
      t.timestamps
    end
  end
end
