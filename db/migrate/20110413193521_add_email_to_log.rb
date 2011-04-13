class AddEmailToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :email, :string
  end

  def self.down
    remove_column :logs, :email
  end
end
