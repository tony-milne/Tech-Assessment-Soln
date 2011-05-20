class AddVerifiedToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :verified, :boolean, :default => 0
  end

  def self.down
    remove_column :products, :verified
  end
end
