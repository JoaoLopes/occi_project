class CreateMeetingPeople < ActiveRecord::Migration
  def change
    create_table :meeting_people do |t|
      t.references :meeting
      t.references :user
      t.boolean :manager
      t.timestamps
    end
  end
end
