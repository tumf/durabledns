#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = CreateRecordwsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   createRecord(apiuser, apikey, zonename, name, type, data, aux, ttl, ddns_enabled)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   name            C_String - {http://www.w3.org/2001/XMLSchema}string
#   type            C_String - {http://www.w3.org/2001/XMLSchema}string
#   data            C_String - {http://www.w3.org/2001/XMLSchema}string
#   aux             Int - {http://www.w3.org/2001/XMLSchema}int
#   ttl             Int - {http://www.w3.org/2001/XMLSchema}int
#   ddns_enabled    C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = zonename = name = type = data = aux = ttl = ddns_enabled = nil
puts obj.createRecord(apiuser, apikey, zonename, name, type, data, aux, ttl, ddns_enabled)


