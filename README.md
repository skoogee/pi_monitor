# Ubuntu Pihole Monitor

""This utility was forked and modifed to enable monitoring of a Pihole server installated on Ubuntu, Thus connecting properly with Pi Stats App for IOS.""

Python utility to get Ubuntu metrics. This is an experimental utility, use at your own risk :)

This is just a very simple Python script using a http server to provide some ubuntu metrics via REST calls, like temperature, load average and more.

## Usage

The server will make a single endpoint available on the default port `8088`:
`http://YOUR_IP:8088/monitor.json` that will return a JSON like this:

```json
{
  "soc_temperature": 50.5,
  "uptime": 18551.34,
  "load_average": [0.0, 0.2, 0.1],
  "kernel_release": "5.4.51-v7+",
  "memory": {
    "total_memory": 441416,
    "free_memory": 90536,
    "available_memory": 279512
  }
}
```

## Installation

### Automatic

`wget -O - https://raw.githubusercontent.com/skoogee/ubuntu_pihole_monitor/master/install.sh | sudo bash`

### Manual

You can download the files manually and run it the way you like. If you don't want Pi Monitor to run as a service you can just run as `python3 ubuntu-pihole_monitor.py`

## Configuration

If you're running it using the automatic installation you can change the username and default port in which Ubuntu Pihole Monitor is running by changing the following settings on your `ubuntu-pihole-monitor.service`

```
[Service]
ExecStart=/usr/bin/python3 -u /usr/local/bin/ubuntu-pihole-monitor.py 8088
User=root
```

Before doing so, make sure to stop the service with
`sudo systemctl stop ubuntu-pihole-monitor.service`
and then start it again after your changes with
`sudo systemctl start ubuntu-pihole-monitor.service`

If you're running it manually you can just change the default port by sending it as a parameter like:
`python3 ubuntu-pihole-monitor.py 8181`

## Compatibility

This was tested on Ubuntu Server 20.04 LTS OS (64 bit), kernel 5.4.0-59-generic
