require "multi_json"

module Tracks

  module Model

    class FileModel

      def initialize(filename)
        @filename = filename
        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i
        @hash = MultiJson.load( File.read(filename) )
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        begin
          FileModel.new("db/phones/#{id}.json")
        rescue
          return nil
        end
      end

      def self.all
        files = Dir["db/phones/*.json"]
        files.map { |f| FileModel.new f }
      end

    end

  end

end
