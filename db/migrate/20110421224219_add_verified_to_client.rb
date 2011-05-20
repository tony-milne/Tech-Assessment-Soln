class AddVerifiedToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :verified, :boolean, :default => 0
  end

  def self.down
    remove_column :clients, :verified
  end
end
