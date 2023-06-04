#!/usr/bin/with-contenv bashio

python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(open("/data/options.json").read())))' > /broadlinkac2mqtt/config/config.yaml
pwd
ls
cd /broadlinkac2mqtt
pwd
ls

## Run your program
./broadlinkac2mqtt