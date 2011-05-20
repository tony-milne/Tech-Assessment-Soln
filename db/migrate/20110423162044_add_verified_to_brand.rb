class AddVerifiedToBrand < ActiveRecord::Migration
  def self.up
    add_column :brands, :verified, :boolean, :default => 0
  end

  def self.down
    remove_column :brands, :verified
  end
end
