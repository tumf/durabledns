require 'xsd/qname'

# {urn:jobwsdl}Job
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
class Job
  attr_accessor :id
  attr_accessor :name

  def initialize(id = nil, name = nil)
    @id = id
    @name = name
  end
end

# {urn:jobwsdl}Jobs
class Jobs < ::Array
end
