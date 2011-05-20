class AddMd5ToBrand < ActiveRecord::Migration
  def self.up
    add_column :brands, :md5, :string
  end

  def self.down
    remove_column :brands, :md5
  end
end
