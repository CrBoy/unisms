module Unisms::Router
	class Base
		def deliver(message, to: nil, from: nil)
			route.deliver message, to: to, from: from
		end
	end
end
