#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = DeleteRecordwsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   deleteRecord(apiuser, apikey, zonename, id)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   id              Int - {http://www.w3.org/2001/XMLSchema}int
#
# RETURNS
#   v_return        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = zonename = id = nil
puts obj.deleteRecord(apiuser, apikey, zonename, id)


