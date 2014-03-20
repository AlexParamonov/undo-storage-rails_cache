require 'json'

module Undo
  module Storage
    class RailsCache

      def initialize(cache = nil, options = {})
        @cache = cache
        @cache ||= Rails.cache if defined? Rails
        @default_options = options
      end

      def store(uuid, object, options = {})
        cache.write uuid, serialize(object), default_options.merge(options)
      end

      def fetch(uuid, options = {})
        deserialize cache.read uuid, default_options.merge(options)
      end

      private
      attr_reader :cache, :default_options

      def serialize(object)
        object.to_json
      end

      def deserialize(data)
        JSON.load data
      end
    end
  end
end
