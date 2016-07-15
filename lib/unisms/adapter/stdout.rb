require_relative "base"

module Unisms::Adapter
	class Stdout < Base
		def deliver(message, to: nil, from: nil)
			puts ["Sending message '#{message}'", to && " to '#{to}'", from && " from '#{from}'", "."].compact.join
			true
		end
	end
end

