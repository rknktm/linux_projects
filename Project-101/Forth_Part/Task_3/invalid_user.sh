#!/bin/bash
awk -F " " '/Invalid user/ {print $8}' auth.log |sort | uniq -c

# grep -Eio "input_userauth_request: invalid user .+ " auth.log | awk '{print $4}' | sort | uniq -c > invalid_user.sh#