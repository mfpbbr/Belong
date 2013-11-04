class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.references :imageable, polymorphic: true
    	t.references :user
    	t.text :text
    	t.attachment :picture
      t.timestamps
    end

    add_index :pictures, [:imageable_type, :imageable_id]
    add_index :pictures, :user_id
  end
end
