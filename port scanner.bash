#!/bin/bash

# Check if target is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <IP or hostname>"
    exit 1
fi

target=$1
echo "Starting port scan on $target..."

# Define port range
start_port=1
end_port=1024

# Loop through ports and check their status
for (( port=$start_port; port<=$end_port; port++ )); do
    # Attempt connection using /dev/tcp
    timeout 1 bash -c "echo > /dev/tcp/$target/$port" 2>/dev/null && \
    echo "Port $port is open"
done

echo "Port scan completed on $target."
