# Changelog

All notable changes to this add-on are documented here. The add-on tracks [broadlinkac2mqtt](https://github.com/ArtemVladimirov/broadlinkac2mqtt) releases.

## 1.6.0

- Experimental AUX / AC Freedom cloud support alongside local LAN devices
- Opt-in `cloud` config: email, password, region (`eu`, `usa`, `cn`)
- Auto-discovery of account devices, with `hidden_devices` and MAC collision checks
- Cloud swing is `off` / `swing`; extra switches are published only when the device reports them

## 1.5.10

- Fix empty Home Assistant `swing_mode` when the AC reports STOP
- Protocol STOP (`FixationVertical = 0`) is mapped to `off` and included in MQTT `swing_modes`

## 1.5.9

- golangci-lint cleanup in the application
- Default `slog` logger, MQTT unsubscribe on shutdown, and safer shutdown context handling

## 1.5.8

- MQTT switches for Clean (`I-CLEAN`) and Health (ionizer)

## 1.5.7

- MQTT switch for anti-mold / fungus-proof mode (`mildew`)

## 1.5.6

- Event-loop AC monitoring: UDP is rate-limited and HA commands no longer fight remote-control polls
- Optional `invert_display` for units with reversed screen ON/OFF mapping
- Add-on installs prebuilt release binaries instead of compiling on the host

## 1.5.5

- Maintenance release

## 1.5.4

- arm64 Docker image support

## 1.5.3

- Fix ambient temperature reported as `0.0`

## 1.4.1

- Unique device names in Home Assistant

## 1.4.0

- Home Assistant add-on support
- Display switch
- MQTT SSL certificates and extra platforms

## 1.3.1

- Temperature precision `0.1`

## 1.3.0

- Ambient temperature above 32 °C
- Logger level fix

## 1.1.1

- Fix incorrect temperature values

## 1.1.0

- Multi-platform binaries
- Fix swapped ambient and target temperature

## 1.0.0

- MQTT SSL support
- Home Assistant birth and last-will messages
- MQTT user and password are optional
- Temperature set-point fixes

## 0.1.0

- Initial release
