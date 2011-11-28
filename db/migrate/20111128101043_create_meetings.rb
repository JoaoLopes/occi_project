class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :datetime
      t.string :subject
      t.text :conclusion
      t.timestamps
    end
  end
end
