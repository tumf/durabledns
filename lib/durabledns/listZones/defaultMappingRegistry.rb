require 'durabledns/listZones/default.rb'
require 'soap/mapping'

module DefaultMappingRegistry
  
  
  NsListZoneswsdl = "urn:listZoneswsdl"

  EncodedRegistry.register(
    :class => Zone,
    :schema_type => XSD::QName.new(NsListZoneswsdl, "Zone"),
    :schema_element => [
      ["origin", ["SOAP::SOAPString", XSD::QName.new(nil, "origin")]]
    ]
  )

  EncodedRegistry.set(
    Zones,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsListZoneswsdl, "Zone") }
  )

  LiteralRegistry.register(
    :class => Zone,
    :schema_type => XSD::QName.new(NsListZoneswsdl, "Zone"),
    :schema_element => [
      ["origin", ["SOAP::SOAPString", XSD::QName.new(nil, "origin")]]
    ]
  )

end
