class CreateVote < ActiveRecord::Migration
  def change
    create table :votes do |t|
      t.integer :user_id
      t.integer :value
      t.integer :voteable_id
      t.string :voteable_type
      t.timestamps
  end
end
