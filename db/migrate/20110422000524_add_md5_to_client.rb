class AddMd5ToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :md5, :string
  end

  def self.down
    remove_column :clients, :md5
  end
end
