#!/bin/sh
green="\x1B[0;32m"
yellow="\x1B[0;33m"
endColor="\x1B[0m"

podname=$(ls | grep '\.podspec$' | sed -n 1p | cut -f 1 -d '.')

echo "${yellow}Redeploying latest library version...${endColor}"
curl http://api.cocoadocs.org:4567/redeploy/$podname/latest

echo "${green}Finished!${endColor}"
