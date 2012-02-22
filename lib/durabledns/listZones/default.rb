require 'xsd/qname'

# {urn:listZoneswsdl}Zone
#   origin - SOAP::SOAPString
class Zone
  attr_accessor :origin

  def initialize(origin = nil)
    @origin = origin
  end
end

# {urn:listZoneswsdl}Zones
class Zones < ::Array
end
