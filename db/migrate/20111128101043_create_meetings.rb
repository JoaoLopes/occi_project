class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :datetime
      t.string :subject
      t.text :conclusion
      t.string :user_link
      t.string :manager_link
      t.timestamps
    end
  end
end
