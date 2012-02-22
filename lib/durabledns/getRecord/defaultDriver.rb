require 'durabledns/getRecord/default.rb'
require 'durabledns/getRecord/defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class GetRecordwsdlPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "https://durabledns.com:443/services/dns/getRecord.php"
  NsGetRecordwsdl = "urn:getRecordwsdl"

  Methods = [
    [ XSD::QName.new(NsGetRecordwsdl, "getRecord"),
      "urn:getRecordwsdl#getRecord",
      "getRecord",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["in", "zonename", ["::SOAP::SOAPString"]],
        ["in", "recordid", ["::SOAP::SOAPInt"]],
        ["retval", "id", ["::SOAP::SOAPInt"]],
        ["out", "name", ["::SOAP::SOAPString"]],
        ["out", "type", ["::SOAP::SOAPString"]],
        ["out", "data", ["::SOAP::SOAPString"]],
        ["out", "aux", ["::SOAP::SOAPInt"]],
        ["out", "ttl", ["::SOAP::SOAPInt"]] ],
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

