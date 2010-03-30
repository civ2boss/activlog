class AddServicedToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :serviced, :boolean
  end

  def self.down
    remove_column :logs, :serviced
  end
end
