class CreateActionItemStatuses < ActiveRecord::Migration
  def change
    create_table :action_item_statuses do |t|
      t.string :name, :limit => 15
      t.timestamps
    end
  end
end
