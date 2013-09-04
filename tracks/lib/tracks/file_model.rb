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

      def update(attrs)
        @hash['phone'] = attrs['phone'] if attrs.has_key?('phone')
        @hash['inventor'] = attrs['inventor'] if attrs.has_key?('inventor')
        self.class.save(@filename, @hash)
      end

      def self.save(filename, hash)
        File.open(filename, 'w') {|f| f.write MultiJson.dump(hash) }
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

      def self.create(attrs)
        hash = {
          'phone' => attrs['phone'] || '',
          'inventor' => attrs['inventor'] || ''
        }
        existing_file_names = Dir['db/phones/*.json'].map { |f| f.split('/')[-1] }
        id = existing_file_names.map { |n| n[0..-5].to_i }.max + 1
        new_filepath = "db/phones/#{id}.json"
        save(new_filepath, hash)
        FileModel.new new_filepath
      end

    end

  end

end
