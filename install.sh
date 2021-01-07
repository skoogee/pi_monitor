#!/bin/bash
systemctl stop ubuntu-pihole-monitor.service

echo ""

echo "Downloading files..."

wget https://raw.githubusercontent.com/skoogee/pi_monitor/master/ubuntu-pihole-monitor.py
wget https://raw.githubusercontent.com/skoogee/pi_monitor/master/ubuntu-pihole-monitor.service

echo ""

echo "Removing old files files..."
rm /usr/local/bin/ubuntu-pihole-monitor.py
rm /etc/systemd/system/ubuntu-pihole-monitor.service

echo ""

echo "Moving files..."
mv ubuntu-pihole-monitor.py /usr/local/bin/
mv ubuntu-pihole-monitor.service /etc/systemd/system/

echo ""

echo "Starting ubuntu-pihole-monitor service..."
systemctl daemon-reload
systemctl enable ubuntu-pihole-monitor.service 
systemctl start ubuntu-pihole-monitor.service
