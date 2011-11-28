class CreateActionItems < ActiveRecord::Migration
  def change
    create_table :action_items do |t|
      t.references :topic
      t.references :action_item_status
      t.string :description
      t.datetime :due
      t.timestamps
    end
    add_index("action_items", "topic_id")
  end
end
