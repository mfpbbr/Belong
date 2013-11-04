class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
    	t.referencs :from, class_name: "user"
    	t.references :to, class_name: "User"
    	t.references :group
      t.timestamps
    end
    add_index :invites, :from_id
    add_index :invites, :to_id
    add_index :invites, [:group_id, :to_id]
  end

end
