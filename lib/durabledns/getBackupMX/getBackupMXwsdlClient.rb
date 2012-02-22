#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = GetBackupMXwsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   getBackupMX(apiuser, apikey, zonename)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   backupmx        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = zonename = nil
puts obj.getBackupMX(apiuser, apikey, zonename)


