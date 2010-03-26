class AddCategoryToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :category, :string
  end

  def self.down
    remove_column :logs, :category
  end
end
