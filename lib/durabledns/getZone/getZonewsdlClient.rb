#!/usr/bin/env ruby
require 'durabledns/getZone/defaultDriver.rb'

endpoint_url = ARGV.shift
obj = GetZonewsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   getZone(apiuser, apikey, zonename)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   origin          C_String - {http://www.w3.org/2001/XMLSchema}string
#   ns              C_String - {http://www.w3.org/2001/XMLSchema}string
#   mbox            C_String - {http://www.w3.org/2001/XMLSchema}string
#   serial          Int - {http://www.w3.org/2001/XMLSchema}int
#   refresh         Int - {http://www.w3.org/2001/XMLSchema}int
#   v_retry         Int - {http://www.w3.org/2001/XMLSchema}int
#   expire          Int - {http://www.w3.org/2001/XMLSchema}int
#   minimum         Int - {http://www.w3.org/2001/XMLSchema}int
#   ttl             Int - {http://www.w3.org/2001/XMLSchema}int
#   xfer            C_String - {http://www.w3.org/2001/XMLSchema}string
#   update_acl      C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = zonename = nil
puts obj.getZone(apiuser, apikey, zonename)


