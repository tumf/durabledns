require 'durabledns/listRecords/default.rb'
require 'soap/mapping'

module DefaultMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsListRecordswsdl = "urn:listRecordswsdl"

  EncodedRegistry.register(
    :class => Record,
    :schema_type => XSD::QName.new(NsListRecordswsdl, "Record"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["data", ["SOAP::SOAPString", XSD::QName.new(nil, "data")]]
    ]
  )

  EncodedRegistry.set(
    Records,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsListRecordswsdl, "Record") }
  )

  LiteralRegistry.register(
    :class => Record,
    :schema_type => XSD::QName.new(NsListRecordswsdl, "Record"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["type", ["SOAP::SOAPString", XSD::QName.new(nil, "type")]],
      ["data", ["SOAP::SOAPString", XSD::QName.new(nil, "data")]]
    ]
  )

end
