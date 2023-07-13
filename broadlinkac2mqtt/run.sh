#!/bin/sh

pwd
ls -l
python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(open("/data/options.json").read())))' > /broadlinkac2mqtt/config/config.yaml
chmod +x /broadlinkac2mqtt/broadlinkac2mqtt
/broadlinkac2mqtt/broadlinkac2mqtt