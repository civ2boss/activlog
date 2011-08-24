class AddIpToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :ip, :string
  end

  def self.down
    add_column :logs, :ip, :string
  end
end
