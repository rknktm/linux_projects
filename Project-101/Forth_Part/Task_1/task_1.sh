#!bin/bash
ip=$(head -20  info.json | tail -1 | cut -b 34-46)
sed "s/ec2-private_ip/$ip/" ./terraform.tf > terraform1.tf