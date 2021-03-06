require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  def from_does_not_equal_to
    # Homework 1.5 - Part 1
    errors.add(:from, "From cannot be the same as To") if @from == @to
  end

  def initialize(api_key='38b99ce9ec87')
    # Homework 1.5 - Part 1
    @from = "Kevin Bacon"
    @to = @from
    @api_key = api_key
  end

  # Homework 1.5 - Part 4
  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e

      raise NetworkError
    end

    OracleOfBacon::Response.new(xml)
  end

  # Homework 1.5 - Part 3
  def make_uri_from_arguments
    @uri = "http://oracleofbacon.org/cgi-bin/xml?enc=utf-8&" +
      "p=#{CGI.escape(@api_key)}&a=#{CGI.escape(@from)}&b=#{CGI.escape(@to)}"
  end
      
  class Response
    attr_reader :type, :data
    
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private
    
    # Homework 1.5 - Part 2
    def parse_response
      if ! @doc.xpath('/error').empty?
        parse_error_response
      elsif ! @doc.xpath('/link').empty?
        parse_graph_response
      elsif ! @doc.xpath('/spellcheck').empty?
        parse_spellcheck_response
      else
        parse_unknown_response
      end
    end
    
    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end
    def parse_graph_response
      @type = :graph
      @data = parse_valid_response_data
    end
    def parse_spellcheck_response
      @type = :spellcheck
      @data = parse_valid_response_data
    end
    def parse_unknown_response
      @type = :unknown
      @data = 'Unknown response type'
    end
    def parse_valid_response_data
      @doc.text.split(/\n/).compact.reject{ |x| x.empty? }.each { |x| x.strip! }
    end
  end
end

