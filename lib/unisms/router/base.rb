module Unisms::Router
	class Base
		def deliver(message, to: nil, from: nil)
			route(message, to: to, from: from).deliver(message, to: to, from: from)
		end
	end
end
