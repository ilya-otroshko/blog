class AddFileToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :file, :string
  end
end
