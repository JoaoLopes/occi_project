class AddMeetingStatus < ActiveRecord::Migration
  def up
    add_column("meetings", "closed", :boolean, :default => false)
  end

  def down
    remove_column("meetings", "closed")
  end
end

