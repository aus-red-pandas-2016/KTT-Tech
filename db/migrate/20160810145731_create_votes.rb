class CreateVote < ActiveRecord::Migration
  def change
    create table :votes do |t|
      t.integer :user_id
      t.integer :value
      t.timestamps
  end
end
