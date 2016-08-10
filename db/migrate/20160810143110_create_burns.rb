class CreateBurn < ActiveRecord::Migration
  def change
    create table :burns do |t|
      t.string :title
      t.integer :user_id
      t.text :burn_description
      t.timestamps
  end
end
