require 'durabledns/getZone/default.rb'
require 'durabledns/getZone/defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class GetZonewsdlPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "https://durabledns.com:443/services/dns/getZone.php"
  NsGetZonewsdl = "urn:getZonewsdl"

  Methods = [
    [ XSD::QName.new(NsGetZonewsdl, "getZone"),
      "urn:getZonewsdl#getZone",
      "getZone",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["in", "zonename", ["::SOAP::SOAPString"]],
        ["retval", "origin", ["::SOAP::SOAPString"]],
        ["out", "ns", ["::SOAP::SOAPString"]],
        ["out", "mbox", ["::SOAP::SOAPString"]],
        ["out", "serial", ["::SOAP::SOAPInt"]],
        ["out", "refresh", ["::SOAP::SOAPInt"]],
        ["out", "retry", ["::SOAP::SOAPInt"]],
        ["out", "expire", ["::SOAP::SOAPInt"]],
        ["out", "minimum", ["::SOAP::SOAPInt"]],
        ["out", "ttl", ["::SOAP::SOAPInt"]],
        ["out", "xfer", ["::SOAP::SOAPString"]],
        ["out", "update_acl", ["::SOAP::SOAPString"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

