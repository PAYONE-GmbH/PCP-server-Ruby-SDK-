require 'net/http'
require 'json'
require 'uri'

require_relative '../communicator_configuration'
require_relative '../request_header_generator'
require_relative '../errors/api_error_response_exception'
require_relative '../errors/api_response_retrieval_exception'

MERCHANT_ID_REQUIRED_ERROR = 'Merchant ID is required'
COMMERCE_CASE_ID_REQUIRED_ERROR = 'Commerce Case ID is required'
CHECKOUT_ID_REQUIRED_ERROR = 'Checkout ID is required'

class BaseApiClient
  def initialize(config)
    @config = config
    @request_header_generator = RequestHeaderGenerator.new(config)
  end

protected

  def get_request_header_generator
    @request_header_generator
  end

  def get_config
    @config
  end

  def make_api_call(url, request_init, &parse_body)
    parse_body ||= BaseApiClient.method(:parse_json)

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    
    headers = @request_header_generator.generate_additional_request_headers(url, request_init || {})
    
    request = build_http_request(uri, request_init, headers)
    response = http.request(request)
    
    body = response.body

    begin
      parsed = JSON.parse(body)
    rescue StandardError => e
      raise ApiResponseRetrievalException.new(response.code.to_i, parsed, e)
    end
    
    unless response.is_a?(Net::HTTPSuccess)
      if is_error_response(body)
        raise ApiErrorResponseException.new(response.code.to_i, body, parsed['errors'] || [])
      else
        raise ApiResponseRetrievalException.new(response.code.to_i, body)
      end
    end
    
    parsed
  end

  def self.parse_void
    nil
  end

  def self.parse_json(body)
    parsed = JSON.parse(body)
    raise TypeError, 'Parsed JSON is not an object' unless parsed.is_a?(Hash)
    
    parsed
  end

private

  def build_http_request(uri, request_init, headers)
    method = request_init[:method].to_s.upcase

    case method
    when 'GET'
      req = Net::HTTP::Get.new(uri)
    when 'POST'
      req = Net::HTTP::Post.new(uri)
      req.body = request_init[:body] if request_init[:body]
    else
      raise ArgumentError, "Unsupported HTTP method: #{method}"
    end

    headers[:headers].each do |key, value|
      req[key] = value
    end

    req
  end

  def is_error_response(parsed)
    return false unless parsed.is_a?(Hash)
    
    if parsed.key?('errorId') && !parsed['errorId'].is_a?(String)
      return false
    end
    if parsed.key?('errors') && !parsed['errors'].is_a?(Array)
      return false
    end
    true
  end
end
