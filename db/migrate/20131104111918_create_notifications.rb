class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.references :notifiable, polymorphic: true
    	t.references :source, class_name: "User"
    	t.string :type
    	t.text :summary
    	t.text :description
      t.timestamps
    end

    add_index :notifications, [:notifiable_id, :notifiable_type]
    add_index :notifications, :source_id
  end
end
