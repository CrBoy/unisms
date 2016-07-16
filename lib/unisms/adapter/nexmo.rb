require "nexmo"
require_relative "base"

module Unisms::Adapter
	class Nexmo < Base
		def initialize(key, secret)
			@nexmo = ::Nexmo::Client.new key: key, secret: secret
		end

		def deliver(message, to: nil, from: nil)
			@nexmo.send_message(text: message, to: to, from: from, type: 'unicode')
			true
		rescue SocketError => e
			Unisms.logger.error "Failed to send message to #{to}"
			false
		end
	end
end

