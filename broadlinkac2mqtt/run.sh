#!/bin/sh

pwd
ls -l
python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(open("/data/options.json").read())))' > /broadlinkac2mqtt/config/config.yml

/broadlinkac2mqtt/broadlinkac2mqtt