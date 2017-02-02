class RenamePasswordColumn < ActiveRecord::Migration
  def change
    rename_column :users, :add_column, :password
  end
end
