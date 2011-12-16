class AddBitmaskRolesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :roles_mask, :integer, :default => 0, :after => :authentication_token
  end

  def self.down
    remove_column :users, :roles
  end
end
