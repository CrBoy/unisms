require "kotsms"
require_relative "base"

module Unisms::Adapter
	class Kotsms < Base
		def initialize(username, password, options = {})
			@kotsms = ::Kotsms.new username, password
			@kotsms_options = options
		end

		def deliver(message, to: nil, from: nil)
			raise ArgumentError.new("phone number should start with '+'") unless /\A\+.*\z/ === to
			@kotsms.deliver to[1..-1], message, @kotsms_options
			true
		rescue ArgumentError => e
			Unisms.logger.error "ArgumentError: #{e}"
		rescue SocketError => e
			Unisms.logger.error "Failed to send message to #{to}"
			false
		end
	end
end

