class CreateMeetingPeople < ActiveRecord::Migration
  def change
    create_table :meeting_people do |t|
      t.references :meeting
      t.references :user
      t.boolean :manager
      t.timestamps
    end
    add_index("meeting_people", "meeting_id")
    add_index("meeting_people", "user_id")
  end
end
