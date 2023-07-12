#!/usr/bin/with-contenv bashio

pwd
ls
ls -l ./broadlinkac2mqtt
python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(open("/data/options.json").read())))' > /broadlinkac2mqtt/config/config.yaml
pwd
ls
ls -l ./broadlinkac2mqtt
/broadlinkac2mqtt/broadlinkac2mqtt