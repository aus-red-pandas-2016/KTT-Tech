class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.text :description
      t.integer :user_id
      t.integer :burn_id
      t.timestamps(null: false)
    end
  end
end
