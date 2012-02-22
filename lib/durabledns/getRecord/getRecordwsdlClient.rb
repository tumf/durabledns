#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = GetRecordwsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   getRecord(apiuser, apikey, zonename, recordid)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   recordid        Int - {http://www.w3.org/2001/XMLSchema}int
#
# RETURNS
#   id              Int - {http://www.w3.org/2001/XMLSchema}int
#   name            C_String - {http://www.w3.org/2001/XMLSchema}string
#   type            C_String - {http://www.w3.org/2001/XMLSchema}string
#   data            C_String - {http://www.w3.org/2001/XMLSchema}string
#   aux             Int - {http://www.w3.org/2001/XMLSchema}int
#   ttl             Int - {http://www.w3.org/2001/XMLSchema}int
#
apiuser = apikey = zonename = recordid = nil
puts obj.getRecord(apiuser, apikey, zonename, recordid)


