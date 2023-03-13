#!/bin/sh
cpu=$(sensors | grep "Package id 0" | awk '{print $4}' | sed 's/+//;s/\.0//;s/°C/°/')
gpu=$(sensors | grep "edge" | awk '{print $2}' | sed 's/+//;s/\.0//;s/°C/°/')
echo "cpu|string|${cpu}"
echo "gpu|string|${gpu}"
echo ""
