require "sqlite3"
require "tracks/sqlite_model"

class MyTable < Tracks::Model::SQLite
end

STDERR.puts MyTable.schema.inspect

new_record = MyTable.create "title" => "another title"
new_record['title'] = 'changed title'
new_record.save!

new_record2 = MyTable.find new_record['id']
puts "Title: #{new_record2['title']}"
