class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :meeting
      t.string :title
      t.text :description
      t.integer :time
      t.text :conclusion
      t.timestamps
    end
  end
end
