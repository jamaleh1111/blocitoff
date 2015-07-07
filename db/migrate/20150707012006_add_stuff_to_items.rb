class AddStuffToItems < ActiveRecord::Migration
  def change
    add_column :items, :expires_at, :datetime
    add_column :items, :completed, :boolean
  end
end
