#!/usr/bin/env ruby
endpoint_url = ARGV.shift
obj = JobwsdlPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   createJob(apiuser, apikey, jobname, zonename, record_id, monitor_type_id, port, interval, email_on_failure, email_to, dns_on_failure, change_dns_to, failure_threshold)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   jobname         C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   record_id       Int - {http://www.w3.org/2001/XMLSchema}int
#   monitor_type_id Int - {http://www.w3.org/2001/XMLSchema}int
#   port            Int - {http://www.w3.org/2001/XMLSchema}int
#   interval        Int - {http://www.w3.org/2001/XMLSchema}int
#   email_on_failure C_String - {http://www.w3.org/2001/XMLSchema}string
#   email_to        C_String - {http://www.w3.org/2001/XMLSchema}string
#   dns_on_failure  C_String - {http://www.w3.org/2001/XMLSchema}string
#   change_dns_to   C_String - {http://www.w3.org/2001/XMLSchema}string
#   failure_threshold Int - {http://www.w3.org/2001/XMLSchema}int
#
# RETURNS
#   v_return        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = jobname = zonename = record_id = monitor_type_id = port = interval = email_on_failure = email_to = dns_on_failure = change_dns_to = failure_threshold = nil
puts obj.createJob(apiuser, apikey, jobname, zonename, record_id, monitor_type_id, port, interval, email_on_failure, email_to, dns_on_failure, change_dns_to, failure_threshold)

# SYNOPSIS
#   deleteJob(apiuser, apikey, job_id)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   job_id          Int - {http://www.w3.org/2001/XMLSchema}int
#
# RETURNS
#   v_return        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = job_id = nil
puts obj.deleteJob(apiuser, apikey, job_id)

# SYNOPSIS
#   updateJob(apiuser, apikey, job_id, jobname, zonename, record_id, monitor_type_id, port, interval, email_on_failure, email_to, dns_on_failure, change_dns_to, failure_threshold, active)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   job_id          Int - {http://www.w3.org/2001/XMLSchema}int
#   jobname         C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   record_id       Int - {http://www.w3.org/2001/XMLSchema}int
#   monitor_type_id Int - {http://www.w3.org/2001/XMLSchema}int
#   port            Int - {http://www.w3.org/2001/XMLSchema}int
#   interval        Int - {http://www.w3.org/2001/XMLSchema}int
#   email_on_failure C_String - {http://www.w3.org/2001/XMLSchema}string
#   email_to        C_String - {http://www.w3.org/2001/XMLSchema}string
#   dns_on_failure  C_String - {http://www.w3.org/2001/XMLSchema}string
#   change_dns_to   C_String - {http://www.w3.org/2001/XMLSchema}string
#   failure_threshold Int - {http://www.w3.org/2001/XMLSchema}int
#   active          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = job_id = jobname = zonename = record_id = monitor_type_id = port = interval = email_on_failure = email_to = dns_on_failure = change_dns_to = failure_threshold = active = nil
puts obj.updateJob(apiuser, apikey, job_id, jobname, zonename, record_id, monitor_type_id, port, interval, email_on_failure, email_to, dns_on_failure, change_dns_to, failure_threshold, active)

# SYNOPSIS
#   listJobs(apiuser, apikey)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   v_return        Jobs - {urn:jobwsdl}Jobs
#
apiuser = apikey = nil
puts obj.listJobs(apiuser, apikey)

# SYNOPSIS
#   getJob(apiuser, apikey, job_id)
#
# ARGS
#   apiuser         C_String - {http://www.w3.org/2001/XMLSchema}string
#   apikey          C_String - {http://www.w3.org/2001/XMLSchema}string
#   job_id          Int - {http://www.w3.org/2001/XMLSchema}int
#
# RETURNS
#   id              Int - {http://www.w3.org/2001/XMLSchema}int
#   jobname         C_String - {http://www.w3.org/2001/XMLSchema}string
#   zonename        C_String - {http://www.w3.org/2001/XMLSchema}string
#   record_id       Int - {http://www.w3.org/2001/XMLSchema}int
#   monitor_type_id Int - {http://www.w3.org/2001/XMLSchema}int
#   port            Int - {http://www.w3.org/2001/XMLSchema}int
#   interval        Int - {http://www.w3.org/2001/XMLSchema}int
#   email_on_failure C_String - {http://www.w3.org/2001/XMLSchema}string
#   email_to        C_String - {http://www.w3.org/2001/XMLSchema}string
#   dns_on_failure  C_String - {http://www.w3.org/2001/XMLSchema}string
#   change_dns_to   C_String - {http://www.w3.org/2001/XMLSchema}string
#   failure_threshold Int - {http://www.w3.org/2001/XMLSchema}int
#   active          C_String - {http://www.w3.org/2001/XMLSchema}string
#
apiuser = apikey = job_id = nil
puts obj.getJob(apiuser, apikey, job_id)


