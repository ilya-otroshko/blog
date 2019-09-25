class AddImageToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :image, :string
  end
end
