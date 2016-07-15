require "unisms/version"
require "unisms/adapter"
require "unisms/router"
require "unisms/logger"
require "unisms/sms"

module Unisms
	def self.new(adapter = nil)
		Sms.new(adapter)
	end

	def self.default_adapter=(adapter)
		Sms.default_adapter = adapter
	end
end
