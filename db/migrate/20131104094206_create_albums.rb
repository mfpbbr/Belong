class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.references :group
    	t.references :creator, class_name: "User"
    	t.string :name
      t.timestamps
    end

    add_index :albums, :group_id
    add_index :albums, :creator_id
  end
end
