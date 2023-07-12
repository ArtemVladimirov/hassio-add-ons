#!/usr/bin/with-contenv bashio

pwd
ls
python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(open("/data/options.json").read())))' > /broadlinkac2mqtt/config/config.yaml
./broadlinkac2mqtt