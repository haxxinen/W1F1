# Topics


### 01. Setup
- usable Wi-Fi cards and specs
  - Alfa AWUS036ACH / AWUS036H
  - TP-Link TL-WN722N
- drivers and other software dependencies
  - Linux tools
  - RTL88xxAU drivers for Linux & macOS
- protocol notes


### 02. Interface management
- get info about plugged-in Wi-Fi cards
  - available interfaces (mode/channel)
  - available frequencies & capabilities
  - drivers and chipset
- manage monitoring mode
  - monitor/managed modes
  - channel switching
- change MAC address (manual/automatically)


### 3. Scan for Wi-Fi networks
- detecting WPA/WPS enabled networks
- capture wireless packets
  - channel hopping on 5GHz
  - saving PCAP dump to file
- discover hidden AP (no SSID broadcasting)


### 4. Connect to AP / create AP
- connect to WPA2 enabled AP via wpa_supplicant
- stable connection to AP on 5GHz via *rtlXX12au* driver
- create AP via Docker container
- packet injection test
- increase transmission power (TX)


### 5. Common attacks
- deauth attack
  - based on white/black lists
  - targeted / broadcast
- bypass MAC access control lists
- WPS attacks
  - relevant reaver repositories
  - active WPS PIN brute-force attack
  - PixieWPS attack (passive - offline)
  - MAC address changing for reaver
  - ZyXEL default WPS PIN
  - WPS push button PBC (social/physical)
- WPA classic handshake attack
  - setup for collecting the handshake
  - dictionary attack via hashcat and other tools
- WPA-PMKID hash cracking
  - setup for collecting PMKID hashes
  - CUDA benchmarks for PMKID hash cracking
- obsolete WEP attacks
  - Chop-Chop/Caffe-Latte
  - create packets w/o the WEP key
  - interactive packet replay & ARP request replay

### 66. Windows notes for WiFi
- create AP with PSK
- find stored PSK for specific AP

### 77. MacOS notes for WiFi
- interface info
- scanning for APs (`airport` and WiFi Explorer Pro)
- interact with Access Point (connect / disconnect / AP info)
- script `macos_wifiscan.sh`: Scan WiFi APs and get a signal coverage by range.

### 88. Methodology
- assessment checklist
- github projects


### 99. Scripts
- `iwmon.sh`: WLAN interface management tool.
- `wifiscan.sh`: Scan for Wi-Fi access points.
- `wpsscan.sh`: WPS scanner for Wi-Fi APs.
