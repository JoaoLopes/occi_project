class AddUserUniqueLink < ActiveRecord::Migration
  def up
    add_column("users", "permalink", :string)
    add_column("meeting_people", "rsvp", :string, :default => "x")
  end

  def down
    remove_column("meeting_people", "rsvp")
    remove_column("users", "permalink")
  end
end
