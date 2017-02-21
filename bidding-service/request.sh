#!/bin/bash

curl -X POST \
	-d "{ \
		\"device_id\": 1, \
		\"device_os\": \"Android\", \
		\"device_geo\": \"CAN\", \
		\"add_size\": \"728X90\", \
		\"placement\": \"Words With Friends 2 iPad\", \
		\"cpm\": \"0.25\" \
	}" \
	-H 'Content-Type: application/json' http://localhost:9292/bid
