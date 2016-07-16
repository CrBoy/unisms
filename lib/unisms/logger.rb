require "logger"

Dir[File.dirname(__FILE__) + '/logger/*.rb'].each {|file| require file }

module Unisms
	@logger = Logger.new STDOUT

	class << self
		attr_accessor :logger
	end
end
