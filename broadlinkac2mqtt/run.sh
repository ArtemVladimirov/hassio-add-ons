#!/bin/sh

pwd
ls -l
python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(open("/data/options.json").read())))' > /broadlinkac2mqtt/config/config.yaml
FILE=/broadlinkac2mqtt/broadlinkac2mqtt
if [ -f "$FILE" ]; then
    echo "$FILE exists."
fi
if [ -d "$FILE" ]; then
    echo "$FILE is a directory."
fi
/broadlinkac2mqtt/broadlinkac2mqtt