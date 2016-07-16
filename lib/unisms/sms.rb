module Unisms
	class Sms
		@default_adapter = Unisms::Adapter::Stdout.new
		class << self
			attr_accessor :default_adapter
		end

		attr_accessor :adapter

		def initialize(adapter = nil)
			@adapter = adapter || self.class.default_adapter
		end

		def deliver(message, to: nil, from: nil)
			Unisms.logger.info "Using #{@adapter} to send message to #{to}"
			@adapter.deliver(message, to: to, from: from)
		end
	end
end
