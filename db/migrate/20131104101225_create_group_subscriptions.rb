class CreateGroupSubscriptions < ActiveRecord::Migration
  def change
    create_table :group_subscriptions do |t|
    	t.references :user
    	t.references :group
      t.timestamps
    end

    add_index :group_subscriptions, :user_id
    add_index :group_subscriptions, :group_id
    add_index :group_subscriptions, [:group_id, :user_id]
  end
end
