class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :name
      t.string :contact_type
      t.text :description
      t.string :social_security

      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
