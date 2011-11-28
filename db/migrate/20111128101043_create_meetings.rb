class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :user
      t.datetime :datetime
      t.string :subject
      t.string :conclusion
      t.timestamps
    end
  end
end
