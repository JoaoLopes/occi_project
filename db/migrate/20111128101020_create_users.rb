class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :name, :limit 50
      t.string :password, :limit 40
      t.string :salt
      t.string :hashed_password
      t.timestamps
    end
  end
end
