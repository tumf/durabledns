require 'durabledns/Job/default.rb'
require 'durabledns/Job/defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class JobwsdlPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "https://durabledns.com:443/services/monitoring/job.php"
  NsJobswsdl = "urn:jobswsdl"
  NsJobwsdl = "urn:jobwsdl"

  Methods = [
    [ XSD::QName.new(NsJobwsdl, "createJob"),
      "urn:jobwsdl#createJob",
      "createJob",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["in", "jobname", ["::SOAP::SOAPString"]],
        ["in", "zonename", ["::SOAP::SOAPString"]],
        ["in", "record_id", ["::SOAP::SOAPInt"]],
        ["in", "monitor_type_id", ["::SOAP::SOAPInt"]],
        ["in", "port", ["::SOAP::SOAPInt"]],
        ["in", "interval", ["::SOAP::SOAPInt"]],
        ["in", "email_on_failure", ["::SOAP::SOAPString"]],
        ["in", "email_to", ["::SOAP::SOAPString"]],
        ["in", "dns_on_failure", ["::SOAP::SOAPString"]],
        ["in", "change_dns_to", ["::SOAP::SOAPString"]],
        ["in", "failure_threshold", ["::SOAP::SOAPInt"]],
        ["retval", "return", ["::SOAP::SOAPString"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsJobwsdl, "deleteJob"),
      "urn:jobwsdl#deleteJob",
      "deleteJob",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["in", "job_id", ["::SOAP::SOAPInt"]],
        ["retval", "return", ["::SOAP::SOAPString"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsJobwsdl, "updateJob"),
      "urn:jobwsdl#updateJob",
      "updateJob",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["in", "job_id", ["::SOAP::SOAPInt"]],
        ["in", "jobname", ["::SOAP::SOAPString"]],
        ["in", "zonename", ["::SOAP::SOAPString"]],
        ["in", "record_id", ["::SOAP::SOAPInt"]],
        ["in", "monitor_type_id", ["::SOAP::SOAPInt"]],
        ["in", "port", ["::SOAP::SOAPInt"]],
        ["in", "interval", ["::SOAP::SOAPInt"]],
        ["in", "email_on_failure", ["::SOAP::SOAPString"]],
        ["in", "email_to", ["::SOAP::SOAPString"]],
        ["in", "dns_on_failure", ["::SOAP::SOAPString"]],
        ["in", "change_dns_to", ["::SOAP::SOAPString"]],
        ["in", "failure_threshold", ["::SOAP::SOAPInt"]],
        ["in", "active", ["::SOAP::SOAPString"]],
        ["retval", "return", ["::SOAP::SOAPString"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsJobswsdl, "listJobs"),
      "urn:jobswsdl#listJobs",
      "listJobs",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["retval", "return", ["Jobs", "urn:jobwsdl", "Jobs"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ],
    [ XSD::QName.new(NsJobswsdl, "getJob"),
      "urn:jobswsdl#getJob",
      "getJob",
      [ ["in", "apiuser", ["::SOAP::SOAPString"]],
        ["in", "apikey", ["::SOAP::SOAPString"]],
        ["in", "job_id", ["::SOAP::SOAPInt"]],
        ["retval", "id", ["::SOAP::SOAPInt"]],
        ["out", "jobname", ["::SOAP::SOAPString"]],
        ["out", "zonename", ["::SOAP::SOAPString"]],
        ["out", "record_id", ["::SOAP::SOAPInt"]],
        ["out", "monitor_type_id", ["::SOAP::SOAPInt"]],
        ["out", "port", ["::SOAP::SOAPInt"]],
        ["out", "interval", ["::SOAP::SOAPInt"]],
        ["out", "email_on_failure", ["::SOAP::SOAPString"]],
        ["out", "email_to", ["::SOAP::SOAPString"]],
        ["out", "dns_on_failure", ["::SOAP::SOAPString"]],
        ["out", "change_dns_to", ["::SOAP::SOAPString"]],
        ["out", "failure_threshold", ["::SOAP::SOAPInt"]],
        ["out", "active", ["::SOAP::SOAPString"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

