#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = UpdateZonewsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   updateZone(apiuser, apikey, zonename, ns, mbox, refresh, v_retry, expire, minimum, ttl, xfer, update_acl)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   ns              C_String - {http://www.w3.org/2001/XMLSchema}string
#   mbox            C_String - {http://www.w3.org/2001/XMLSchema}string
#   refresh         Int - {http://www.w3.org/2001/XMLSchema}int
#   v_retry         Int - {http://www.w3.org/2001/XMLSchema}int
#   expire          Int - {http://www.w3.org/2001/XMLSchema}int
#   minimum         Int - {http://www.w3.org/2001/XMLSchema}int
#   ttl             Int - {http://www.w3.org/2001/XMLSchema}int
#   xfer            C_String - {http://www.w3.org/2001/XMLSchema}string
#   update_acl      C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = zonename = ns = mbox = refresh = v_retry = expire = minimum = ttl = xfer = update_acl = nil
puts obj.updateZone(apiuser, apikey, zonename, ns, mbox, refresh, v_retry, expire, minimum, ttl, xfer, update_acl)


