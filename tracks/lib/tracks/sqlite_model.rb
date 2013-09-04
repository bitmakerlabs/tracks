require "sqlite3"
require "tracks/util"

DB = SQLite3::Database.new "test.db"

module Tracks

  module Model

    class SQLite
      def self.table
        Tracks.to_underscore name
      end
      def self.schema
        return @schema if @schema
        @schema = {}
        DB.table_info(table) do |row|
          @schema[row['name']] = row['type']
        end
        @schema
      end
    end

  end

end
