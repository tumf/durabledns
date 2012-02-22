require 'xsd/qname'

# {urn:listRecordswsdl}Record
#   id - SOAP::SOAPInt
#   name - SOAP::SOAPString
#   type - SOAP::SOAPString
#   data - SOAP::SOAPString
class Record
  attr_accessor :id
  attr_accessor :name
  attr_accessor :type
  attr_accessor :data

  def initialize(id = nil, name = nil, type = nil, data = nil)
    @id = id
    @name = name
    @type = type
    @data = data
  end
end

# {urn:listRecordswsdl}Records
class Records < ::Array
end
