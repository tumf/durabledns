#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
$:.unshift(File.expand_path(File.join(File.dirname(__FILE__),'..')))
require 'durabledns'
module Durabledns
  class Zone
    attr_accessor :origin,:ns,:mbox,:serial,:refresh,:v_retry
    attr_accessor :expire,:minimum,:ttl,:xfer,:update_acl
  end

  class Api
    def exec name,*args
      if /Job/ =~ name.to_s
        require "durabledns/Job/defaultDriver.rb"
      else
        require "durabledns/#{name}/defaultDriver.rb"
      end
      cap = name.to_s
      cap[0] = cap.upcase[0]
      cls = eval "#{cap}wsdlPortType"

      apiuser = ENV["DURABLEDNS_APIUSER"]
      apikey =  ENV["DURABLEDNS_APIKEY"]
      unless apiuser and apikey
        raise "set ENV DURABLEDNS_APIUSER and DURABLEDNS_APIKEY"
      end
      args = [apiuser,apikey]+args
      endpoint_url = "https://durabledns.com/services/dns/#{name}.php"
      cls.new(endpoint_url).send(name,*args)
    end

    def zones
      exec(:listZones).collect { |z| zone(z.origin) }
    end

    def zone name
      res = exec(:getZone,name)
      zone = Zone.new

      zone.origin = res[0]
      zone.ns = res[1]
      zone.mbox = res[2]
      zone.serial = res[3]
      zone.refresh = res[4]
      zone.v_retry = res[5]
      zone.expire = res[6]
      zone.minimum = res[7]
      zone.ttl = res[8]
      zone.xfer = res[9]
      zone.update_acl = res[10]
      zone
    end


  end
end

if $0 == __FILE__
  api = Durabledns::Api.new
  exit
end

