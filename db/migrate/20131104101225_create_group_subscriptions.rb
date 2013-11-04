class CreateGroupSubscriptions < ActiveRecord::Migration
  def change
    create_table :group_subscriptions do |t|

      t.timestamps
    end
  end
end
