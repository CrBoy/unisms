module Unisms
	class Sms
		@default_adapter = nil
		class << self
			attr_accessor :default_adapter
		end

		attr_accessor :adapter

		def initialize(adapter = nil)
			@adapter = adapter || self.class.default_adapter
		end

		def deliver(message, to: nil, from: nil)
			@adapter.deliver(message, to: to, from: from)
		end
	end
end
