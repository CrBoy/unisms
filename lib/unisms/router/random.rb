require_relative 'base'

module Unisms::Router
	class Random < Base
		attr_accessor :available_adapters

		def initialize(available_adapters = nil)
			@available_adapters = available_adapters.is_a?(Array) ? available_adapters : [available_adapters].compact
		end

		def route
			@available_adapters.sample
		end
	end
end

module Unisms::Router
	class Random < Base
		def load_internal_adapters
			adaptor_module = Unisms::Adapter
			klasses = adaptor_module.constants.reject{ |c| c == :Base }.select { |c| adaptor_module.const_get(c).is_a? Class }.map {|c| adaptor_module.const_get c }
			@available_adapters = klasses.map { |klass| klass.new rescue nil }.compact
		end
	end
end
