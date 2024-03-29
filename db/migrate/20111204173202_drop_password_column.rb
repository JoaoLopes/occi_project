class DropPasswordColumn < ActiveRecord::Migration
  def up
    remove_column("users", "password")
  end

  def down
    add_column("users", "password", :string, :limit => 40)
  end
end
