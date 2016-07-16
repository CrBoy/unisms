require_relative 'base'

module Unisms::Router
	class Random < Base
		attr_accessor :adapters

		def initialize(adapters = nil)
			@adapters = adapters.is_a?(Array) ? adapters : [adapters].compact
		end

		def route
			@adapters.sample
		end
	end
end

module Unisms::Router
	class Random < Base
		def load_internal_adapters
			adapter_module = Unisms::Adapter
			klasses = adapter_module.constants.reject{ |c| c == :Base }.select { |c| adapter_module.const_get(c).is_a? Class }.map {|c| adapter_module.const_get c }
			@adapters = klasses.map { |klass| klass.new rescue nil }.compact
		end
	end
end
