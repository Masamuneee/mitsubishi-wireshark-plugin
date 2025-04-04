# Mitsubishi Protocols Wireshark Plugin

A comprehensive collection of Wireshark dissectors for Mitsubishi industrial protocols, including MELSEC, SLMP, and CC-Link IE Field.

## Features

- **MELSEC Protocol Support**: Complete dissection of all MC protocol variants (3E/4E frames)
- **SLMP Protocol Support**: Full support for SLMP (Seamless Message Protocol) frames
- **CC-Link IE Field**: Basic support for CC-Link IE Field Network protocol
- **Authentication Errors**: Specialized decoding of authentication and security errors
- **Unified Design**: Common interface for related industrial protocols

## Installation

1. Create a plugins directory in your Wireshark personal configuration folder if it doesn't exist:
   - Windows: `%APPDATA%\Wireshark\plugins\`
   - Linux: `~/.local/lib/wireshark/plugins/`
   - macOS: `~/.config/wireshark/plugins/`

2. Copy all `.lua` files from this repository to your plugins directory

3. Restart Wireshark

## Supported Protocols

### MELSEC Communication Protocol
- 3E/4E frames (Binary and ASCII)
- Device read/write operations
- Parameter access
- Remote control commands
- Module information commands

### SLMP (Seamless Message Protocol)
- ST Frames (Single Task)
- MT Frames (Multi Task)
- EMT Frames (Extended Multi Task)
- LMT Frames (Large Multi Task)
- Support for both binary and ASCII encoding

### CC-Link IE Field Network
- Basic cyclic data
- Network parameters
- Status information

## Usage

The plugin automatically detects MELSEC and SLMP traffic on their standard ports:
- MELSEC: TCP/UDP port 5562
- SLMP: TCP/UDP port 2000
- CC-Link IE: UDP ports 45237, 45238, 45239, 61440, 61443

For non-standard ports, you can use the "Decode As..." feature in Wireshark to manually specify the protocol.

## Examples

Request:

![alt text](/image/request.png "Request")

Response:

![alt text](/image/response.png "Response")

