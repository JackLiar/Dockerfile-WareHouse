#! /bin/bash
curl \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"name":"test_token","validity":10,"user":"admin","password":"12345678"}' \
    localhost:8855/api/v1/meuse/token
