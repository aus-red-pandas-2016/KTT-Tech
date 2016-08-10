class RenamePasswordColumn < ActiveRecord::Migration
  def change
    remove_column :users, :password, :string
    add_column :users, :secure_password, :string  
  end
end
