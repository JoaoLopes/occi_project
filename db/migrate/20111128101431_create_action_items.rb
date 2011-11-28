class CreateActionItems < ActiveRecord::Migration
  def change
    create_table :action_items do |t|
      t.references :topic
      t.references :action_item_status
      t.string :description
      t.timedate :due
      t.timestamps
    end
  end
end
