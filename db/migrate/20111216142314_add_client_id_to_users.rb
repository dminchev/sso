class AddClientIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :client_id, :integer, :default => 0, :after => :roles_mask
  end
end
