require 'durabledns/listRecords/default.rb'
require 'durabledns/listRecords/defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class ListRecordswsdlPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "https://durabledns.com:443/services/dns/listRecords.php?debug=1"
  NsListRecordswsdl = "urn:listRecordswsdl"

  Methods = [
    [ XSD::QName.new(NsListRecordswsdl, "listRecords"),
      "urn:listRecordswsdl#listRecords",
      "listRecords",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["in", "zonename", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Records", "urn:listRecordswsdl", "Records"]] ],
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

