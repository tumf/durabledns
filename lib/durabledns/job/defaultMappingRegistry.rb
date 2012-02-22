require 'durabledns/Job/default.rb'
require 'soap/mapping'

module DefaultMappingRegistry
  
  
  NsJobwsdl = "urn:jobwsdl"

  EncodedRegistry.register(
    :class => Job,
    :schema_type => XSD::QName.new(NsJobwsdl, "Job"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]]
    ]
  )

  EncodedRegistry.set(
    Jobs,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsJobwsdl, "Job") }
  )

  LiteralRegistry.register(
    :class => Job,
    :schema_type => XSD::QName.new(NsJobwsdl, "Job"),
    :schema_element => [
      ["id", ["SOAP::SOAPInt", XSD::QName.new(nil, "id")]],
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]]
    ]
  )

end
