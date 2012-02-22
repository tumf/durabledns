
a DurableDNS API-Client
=======================

This software is *UNOFFICIAL* of DurableDNS.

SETUP
-----

1. set your environment variable

* DURABLEDNS_APIUSER
* DURABLEDNS_APIKEY


    export DURABLEDNS_APIUSER={YOUR API USER}
    export DURABLEDNS_APIKEY={YOUR API KEY}

USE
---

    api = Durabledns::API.new
    p api.exec :listZones
