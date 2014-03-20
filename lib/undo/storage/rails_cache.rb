require 'json'

module Undo
  module Storage
    class RailsCache

      def initialize(cache = nil, options = {})
        @cache = cache
        @cache ||= Rails.cache if defined? Rails
        @options = options
      end

      def put(uuid, object)
        cache.write uuid, serialize(object), options
      end

      def fetch(uuid)
        deserialize cache.read uuid, options
      end

      private
      attr_reader :cache, :options

      def serialize(object)
        object.to_json
      end

      def deserialize(data)
        JSON.load data
      end
    end
  end
end
