#! /bin/bash
curl \
    --header "Content-Type: application/json" \
    --request POST \
    -H "Authorization: HhqLVFVvTzi+sY0ewvjnVwWnbPmdTOTOZoDJniBVDoJoDWxxU1tvqa0sASWGGorMjJY=" \
    --data '{"active":true,"description":"test user","name":"testuser","password":"securepassword","role":"tech"}' \
    localhost:8855/api/v1/meuse/user
