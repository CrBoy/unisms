require "nexmo"
require_relative "base"

module Unisms::Adapter
	class Nexmo < Base
		def initialize(key, secret)
			@nexmo = ::Nexmo::Client.new key: key, secret: secret
		end

		def deliver(message, to: nil, from: nil)
			raise ArgumentError.new "'from' is required in Nexmo" if from.nil?
			response = @nexmo.send_message(text: message, to: to, from: from, type: 'unicode')
			Unisms.logger.debug response
			true
		rescue ArgumentError => e
			Unisms.logger.error "ArgumentError: #{e}"
			false
		rescue SocketError => e
			Unisms.logger.error "Failed to send message to #{to}"
			false
		end
	end
end

