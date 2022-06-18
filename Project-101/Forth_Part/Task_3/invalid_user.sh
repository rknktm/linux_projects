#!/bin/bash
awk -F " " '/authentication failure/ {if ($15 != "") print $15}' auth.log |sort | uniq -c
