class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
    	t.references :user
    	t.references :group
    	t.datetime :from
    	t.datetime :to
    	t.float :latitude
    	t.float :longitude
      t.timestamps
    end

    add_index :availabilities, :user_id
    add_index :availabilities, :group_id
    add_index :availabilities, [:group_id, :user_id]
  end
end
