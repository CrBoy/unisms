require "kotsms"
require_relative "base"

module Unisms::Adapter
	class Kotsms < Base
		def initialize(username, password, options = {})
			@kotsms = ::Kotsms.new username, password
			@kotsms_options = options
		end

		def deliver(message, to: nil, from: nil)
			@kotsms.deliver to, message, @kotsms_options
			true
		rescue SocketError => e
			false
		end
	end
end

