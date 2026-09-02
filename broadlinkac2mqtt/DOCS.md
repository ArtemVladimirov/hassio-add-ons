# Home Assistant Add-on: broadlinkac2mqtt

Control Broadlink-based air conditioners from Home Assistant over MQTT. One add-on instance can talk to several units independently: if one AC is offline, the others keep working.

Upstream project: [ArtemVladimirov/broadlinkac2mqtt](https://github.com/ArtemVladimirov/broadlinkac2mqtt)

## Installation

1. Settings → Add-ons → Add-on Store → Repositories
2. Add `https://github.com/ArtemVladimirov/hassio-add-ons`
3. Install **broadlinkac2mqtt** and start it

MQTT is required. Use the Mosquitto broker add-on or any other MQTT broker reachable from Home Assistant.

## Configuration

### service

| Option | Default | Description |
| --- | --- | --- |
| `update_interval` | `10` | Device poll interval in seconds |
| `log_level` | `error` | `error`, `debug`, `fatal`, `disabled`, or `info` |

### mqtt

| Option | Required | Description |
| --- | --- | --- |
| `broker` | yes | Broker URL, for example `mqtt://192.168.1.10:1883`. Use `mqtts://` for TLS |
| `user` | no | MQTT username |
| `password` | no | MQTT password |
| `client_id` | no | MQTT client id (default: `broadlinkac`) |
| `topic_prefix` | no | MQTT topic prefix (default: `airac`) |
| `auto_discovery_topic` | no | Home Assistant discovery prefix, usually `homeassistant` |
| `auto_discovery_topic_retain` | no | Retain discovery messages (default: `true`) |
| `certificate_authority` | no | CA certificate filename for TLS |
| `skip_cert_cn_check` | no | Skip broker certificate CN check (default: `true`) |
| `certificate_client` | no | Client certificate filename |
| `key-client` | no | Client key filename |

### devices

Each local unit needs `ip`, `mac`, `name`, and `port`.

| Option | Required | Description |
| --- | --- | --- |
| `ip` | yes | Device IP address |
| `mac` | yes | MAC without separators, for example `34ea345b0fd4` |
| `name` | yes | Display name in Home Assistant |
| `port` | yes | Device port, usually `80` |
| `temperature_unit` | no | `C` or `F` (default: `C`) |
| `invert_display` | no | Flip ON/OFF mapping for units with reversed screen logic |
| `transport` | no | `local` or `cloud`. Omit for local devices |
| `device_id` | no | AUX / AC Freedom `endpointId`. Needed only for a manually added cloud unit |

Example:

```yaml
devices:
  - ip: 192.168.1.12
    mac: 34ea345b0fd4
    name: Childroom AC
    port: 80
    temperature_unit: C
    invert_display: false
```

### cloud (experimental)

AUX units that are only reachable through AC Freedom. Local devices keep working when this block is omitted or `enabled` is `false`.

This is not generic Broadlink Cloud support. The vendor API is undocumented and may change.

| Option | Description |
| --- | --- |
| `enabled` | Turn cloud support on |
| `email` | AC Freedom account email |
| `password` | AC Freedom account password |
| `region` | `eu`, `usa`, or `cn` |
| `auto_discover` | Discover devices from the account |
| `hidden_devices` | Names to skip during discovery |
| `temperature_unit` | `C` or `F` for discovered cloud units |

Requirements:

- An AC Freedom account
- Internet access from Home Assistant
- Region `eu`, `usa`, or `cn`

Discovered cloud units are identified in MQTT / Home Assistant by MAC. If a local device already uses that MAC, the local device wins.

Leave `device_id` empty when `auto_discover` is `true`. Set it only if you add a cloud unit by hand:

```yaml
devices:
  - transport: cloud
    mac: 34ea345b0fd4
    name: Living Room AC
    device_id: "1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6p"
```

Cloud limitations:

- Only AUX / AC Freedom devices that appear in account discovery and support `DNA.KeyValueControl`
- Cloud swing is on/off, not the 8 local vane positions
- Account password is stored in add-on options; treat it as a secret

## Known issues

### Checksum is incorrect

If checksum validation fails, remove the device from the AC Freedom app, reset Wi-Fi, reconnect once, then cancel pairing so the unit stays on the LAN. If it still fails, the model may be unsupported. A hardware approach is described in the [esphome_aux_ac_component README](https://github.com/GrKoR/esphome_aux_ac_component/blob/06388ebb2c2792098e93dd844c3c812440a06288/README-EN.md#esphome-aux-air-conditioner-custom-component-aux_ac).

## Support

Issues and source: [ArtemVladimirov/broadlinkac2mqtt](https://github.com/ArtemVladimirov/broadlinkac2mqtt)
