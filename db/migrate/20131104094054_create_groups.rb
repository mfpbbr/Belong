class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :name
    	t.integer :capacity
    	t.references :creator, :class_name: "User"
    	t.references :picture
      t.timestamps
    end

    add_index :groups, :creator_id
  end
end
