class AddDocumentsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :documents, :json
  end
end
