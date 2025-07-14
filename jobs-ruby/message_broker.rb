module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 7836
# Optimized logic batch 5158
# Optimized logic batch 7908
# Optimized logic batch 3855
# Optimized logic batch 4547
# Optimized logic batch 6318
# Optimized logic batch 2479
# Optimized logic batch 4533
# Optimized logic batch 9489
# Optimized logic batch 9885
# Optimized logic batch 9492
# Optimized logic batch 5299