require 'faraday'
require 'faraday/multipart'

module Gotenberg
  class Client
    attr_reader :base_path

    def initialize base_path
      @base_path = base_path
    end

    def adapter
      @adapter ||= Faraday.new(base_path) do |c|
        c.request :multipart
        c.request :url_encoded
        c.adapter :net_http
        c.response :raise_error
      end
    end
  end
end