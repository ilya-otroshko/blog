class AddDocumentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :document, :string
  end
end
