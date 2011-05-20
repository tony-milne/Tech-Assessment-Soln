class AddMd5ToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :md5, :string
  end

  def self.down
    remove_column :products, :md5
  end
end
