#File: reminders.rb
require "active_record"

#Adapter for the SQLite3
ActiveRecord::Base::establish_connection(:adapter => "sqlite3",:database => "remindersdb.sqlite")

#Define database schema, and create database "reminders"
class RemindersTableScript < ActiveRecord::Migration
  def self.up
    create_table :reminders do |r|
      r.string :task
      r.string :due_date
      r.string :completion
    end
  end
  def self.down
    drop_table :reminders
  end
end

#Create the table that will be used in the database
RemindersTableScript.up unless File::exists?("remindersdb.sqlite")

class Reminders < ActiveRecord::Base
end
