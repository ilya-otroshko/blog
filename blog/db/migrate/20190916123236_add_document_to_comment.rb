class AddDocumentToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :document, :string
  end
end
