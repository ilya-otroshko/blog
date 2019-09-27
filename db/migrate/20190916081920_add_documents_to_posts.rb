class AddDocumentsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :documents, :json
  end
end
