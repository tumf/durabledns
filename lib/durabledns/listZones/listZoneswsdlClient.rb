#!/usr/bin/env ruby
require 'durabledns/listZones/defaultDriver.rb'

endpoint_url = ARGV.shift
obj = ListZoneswsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   listZones(apiuser, apikey)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Zones - {urn:listZoneswsdl}Zones
#
apiuser = apikey = nil
puts obj.listZones(apiuser, apikey)


