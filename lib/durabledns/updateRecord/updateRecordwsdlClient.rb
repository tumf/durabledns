#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = UpdateRecordwsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   updateRecord(apiuser, apikey, zonename, id, name, aux, data, ttl, ddns_enabled)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   id              Int - {http://www.w3.org/2001/XMLSchema}int
#   name            C_String - {http://www.w3.org/2001/XMLSchema}string
#   aux             Int - {http://www.w3.org/2001/XMLSchema}int
#   data            C_String - {http://www.w3.org/2001/XMLSchema}string
#   ttl             Int - {http://www.w3.org/2001/XMLSchema}int
#   ddns_enabled    C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = zonename = id = name = aux = data = ttl = ddns_enabled = nil
puts obj.updateRecord(apiuser, apikey, zonename, id, name, aux, data, ttl, ddns_enabled)


