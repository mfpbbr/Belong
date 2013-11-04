class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :group
    	t.references :user
    	t.text :text
    	t.attachment :picture
      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :group_id
    add_index :posts, [:user_id, :group_id]
  end
end
