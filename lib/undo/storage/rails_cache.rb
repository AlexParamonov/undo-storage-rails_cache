require 'undo/storage/adapter'

module Undo
  module Storage
    class RailsCache < Adapter
      def initialize(cache = nil, options = {})
        @cache = cache
        @cache ||= Rails.cache if defined? Rails

        super options
      end

      def store(uuid, object, options = {})
        cache.write uuid,
                    pack(object),
                    adapter_options(options)
      end

      def fetch(uuid, options = {})
        unpack cache.read uuid, adapter_options(options)
      end

      def delete(uuid, options = {})
        cache.delete uuid, adapter_options(options)
      end

      private
      attr_reader :cache
    end
  end
end
