class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :user
    	t.references :commentable, polymorphic: true
    	t.text :text
      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, :user_id
  end
end
